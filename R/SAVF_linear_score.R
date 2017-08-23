#' Description: This function will calculate the SAVF score for a linearly increasing or decreasing function. It calculates the score based on the midpoint value method.

#' Required Inputs: Attribute raw value (x), Lowest value (x_low), midpoint value (x_mid), highest value (x_high), Increment(1 = increasing, 2 = decreasing).

#' Output: Linear SAVF Score.
#'
#' @export

SAVF_linear_score <- function(x, x_low, x_mid, x_high, increment = 1) {

  if (increment == 1) {
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
