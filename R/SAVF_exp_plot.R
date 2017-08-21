#' Description: This function will plot an increasing or decreasing exponential SAVF curve. It calls the SAVF_calc_rho and SAVF_exp_score functions and plots your score on the curve with a blue dot.
#'
#' Required Inputs: Attribute raw value (x), Lowest value (x_low), midpoint value (x_mid), highest value (x_high), Increment(1 = increasing, 2 = decreasing).
#'
#' Output: Exponential SAVF curve with attribute plotted.

SAVF_exp_plot <- function(x, x_low, x_mid, x_high, increment = 1) {

  if (increment == 1){
    rho <- SAVF_calc_rho(x_low, x_mid, x_high, increment = 1)
    x_desired <- x
    y_desired <- SAVF_exp_score(x, x_low, x_mid, x_high, increment = 1)
    x <- seq(x_low, x_high, by = (x_high - x_low)/1000)
    v <- SAVF_exp_score(x, x_low, x_mid, x_high, increment = 1)
    df <- data.frame(x = x, v = v)
    ggplot(df, aes(x,v)) +
      geom_line() +
      geom_point(aes(y = y_desired, x = x_desired), size = 3,
                 color = "blue") +
      xlab("Raw Value") + ylab("SAVF Score")
  } else {
    rho <- SAVF_calc_rho(x_low, x_mid, x_high, increment = 2)
    x_desired <- x
    y_desired <- SAVF_exp_score(x, x_low, x_mid, x_high, increment = 2)
    x <- seq(x_low, x_high, by = (x_high - x_low)/1000)
    v <- SAVF_exp_score(x, x_low, x_mid, x_high, increment = 2)
    df <- data.frame(x = x, v = v)
    ggplot(df, aes(x,v)) +
      geom_line() +
      geom_point(aes(y = y_desired, x = x_desired), size = 3,
                 color = "blue") +
      xlab("Raw Value") + ylab("SAVF Score")
  }
}
