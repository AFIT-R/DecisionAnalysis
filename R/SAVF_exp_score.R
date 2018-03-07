#'@title Single Attribute Value Function (SAVF) Exponential Score
#' 
#'@description: Calculates the Single Attribute Values Function (SAVF) score for an exponentially increasing or decreasing function. 
#'It calls the SAVF_calc_rho function, so knowing rho beforehand is not necessary.
#'
#'@param x Attribute raw value
#'@param x_low Lowest value
#'@param x_mid Midpoint value
#'@param x_high Highest value
#'@param increasing TRUE=increasing, FALSE=decreasing, Default: TRUE
#'
#'@details 
#'For Z=((x_mid - x_low) / (x_high - x_low)),
#'Z can not be in (0.51,0.49)
#'
#'@return Exponential SAVF Score
#'
#'@examples
#'\dontrun{ SAVF_exp_score(70, 0, 90, 150, FALSE)}
#'
#'@export

SAVF_exp_score <- function(x, x_low, x_mid, x_high, increasing = TRUE) {
  
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
    rho <- SAVF_calc_rho(x_low, x_mid, x_high, increasing = TRUE)
    value <- (1 - exp(-(x - x_low) / rho)) / (1 - exp(-(x_high -  x_low) / rho))
    return(value)
  } else {
    rho <- SAVF_calc_rho(x_low, x_mid, x_high, increasing = FALSE)
    value <- (1 - exp(-(x_high - x) / rho))/(1 - exp(-(x_high -  x_low) / rho))
    return(value)
  }
  }
