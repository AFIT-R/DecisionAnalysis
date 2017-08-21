#' Description: This function will calculate the SAVF score for an exponentially increasing or decreasing function. It calls the SAVF_calc_rho function, so knowing rho before hand is not necessary.

#' Required Inputs: Attribute raw value (x), Lowest value (x_low), midpoint value (x_mid), highest value (x_high), Increment(1 = increasing, 2 = decreasing).

#' Output: Exponential SAVF Score

SAVF_exp_score <- function(x, x_low, x_mid, x_high, increment = 1) {

  if (increment == 1) {
    rho <- SAVF_calc_rho(x_low, x_mid, x_high, increment = 1)
    value <- (1 - exp(-(x - x_low) / rho)) / (1 - exp(-(x_high -  x_low) / rho))
    return(value)
  } else {
    rho <- SAVF_calc_rho(x_low, x_mid, x_high, increment = 2)
    value <- (1 - exp(-(x_high - x) / rho))/(1 - exp(-(x_high -  x_low) / rho))
    return(value)
    }
  }
