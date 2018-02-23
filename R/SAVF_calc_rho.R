#'@title Single Attribute Value Function (SAVF) Calculate Rho
#' 
#'@description: Calculates rho for an exponential function.
#'
#'@param x_low Lowest value
#'@param x_mid Midpoint value
#'@param x_high Highest value
#'@param increasing TRUE=increasing, FALSE=decreasing, Default: TRUE
#'
#'@details
#'For Z=((x_mid - x_low) / (x_high - x_low)),
#'Z can not be in (0.51,0.49)
#'
#'@return Rho
#'
#'@importFrom stats uniroot
#'
#'@examples
#'\dontrun{ SAVF_calc_rho(0, 90, 150, FALSE)}
#'
#'@export


SAVF_calc_rho <- function(x_low, x_mid, x_high, increasing = TRUE){
  
  if(x_low >x_high | x_low>x_mid) {
    stop('The input for x_low exceeds either x_mid or x_high')
  }
  if(x_high<x_mid) {
    stop('The input for x_mid exceeds x_high')
  }
  
  if((0.490386<((x_mid - x_low) / (x_high - x_low)))&(((x_mid - x_low) / (x_high - x_low))<0.509614)){
    stop('Please adjust x_mid.
         For Z=((x_mid - x_low) / (x_high - x_low)),
         Z can not be in (0.51,0.49)')
  }

  if (increasing == TRUE) {
    z = (x_mid - x_low) / (x_high - x_low)

    if (z <= 0.5) {
      f1 <- function (r) (-0.5 + (1 - exp(-z / r)) / (1 - exp(-1 / r)))
      value <- stats::uniroot(f1, interval = c(0,13))
      R <- value$root
      rho = R * (x_high - x_low)
      return(rho)
    } else {
      z = 1-z
      f1 <- function (r) (-0.5 + (1 - exp(-z / r)) / (1 - exp(-1 / r)))
      value <- stats::uniroot(f1, interval = c(0,13))
      R <- -value$root
      rho = R * (x_high - x_low)
      return(rho)
    }}  
  else {
      z = (x_high - x_mid) / (x_high - x_low)

      if (z <= 0.5) {
        f1 <- function (r) (-0.5 + (1 - exp(-z / r)) / (1 - exp(-1 / r)))
        value <- stats::uniroot(f1, interval = c(0,13))
        R <- value$root
        rho = R * (x_high - x_low)
        return(rho)
      } else {
        z = 1 - z
        f1 <- function (r) (-0.5 + (1 - exp(-z / r)) / (1 - exp(-1 / r)))
        value <- stats::uniroot(f1, interval = c(0,13))
        R <- -value$root
        rho = R * (x_high - x_low)
        return(rho)
      } 
    } 
}
