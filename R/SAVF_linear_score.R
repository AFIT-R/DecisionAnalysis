#'@title Single Attribute Value Function (SAVF) Linear Score
#'
#'@description: Calculates the Single Attribute Value Function (SAVF) score for a linearly increasing or decreasing function. 
#'It calculates the score based on the midpoint value method.
#'
#'@param x Attribute raw value
#'@param x_low Lowest value
#'@param x_mid Midpoint value
#'@param x_high Highest value
#'@param increasing TRUE=increasing, FALSE=decreasing, Default: TRUE
#'
#'@return Linear SAVF Score
#'
#'@examples
#'\dontrun{ SAVF_linear_score(10, 0, 25, 100, FALSE)}
#'
#'@export

SAVF_linear_score <- function(x, x_low, x_mid, x_high, increasing = TRUE) {
  
  if(x_low >x_high | x_low>x_mid) {
    stop('The input for x_low exceeds either x_mid or x_high')
  }
  if(x_high<x_mid) {
    stop('The input for x_mid exceeds x_high')
  }

  if (increasing == TRUE) {
    if (x <= x_mid) {
      value <- 0.5 * ((x - x_low) / (x_mid - x_low))
      return(value)
    } else {
      value <- 0.5 + 0.5 * ((x - x_mid) / (x_high - x_mid))
      return(value)
    }} else {
      if (x <= x_mid) {
        value <- 1 - 0.5 * ((x - x_low) / (x_mid - x_low))
        return(value)
      } else {
        value <- 0.5 - 0.5 * ((x - x_mid) / (x_high - x_mid))
        return(value)
        }
    }
}
