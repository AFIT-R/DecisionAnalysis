#' Description: The function above calculates rho for an exponential function.

#' Required inputs:Lowest Value (x_low), Midpoint Value (x_mid), Highest Value (x_high), Increment(1 = increasing, 2 = decreasing).

#' Output: Rho

SAVF_calc_rho <- function(x_low, x_mid, x_high, increment = 1){

  if (increment == 1) {
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
    }}  else {
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
