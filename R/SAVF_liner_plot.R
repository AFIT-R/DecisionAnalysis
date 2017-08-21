#' Description: This function will calculate the linear SAVF curve for an increasing or decreasing function. It calls the SAVF_linear_score function to calculate the score based on the midpoint value method and plots it with a blue dot.
#'
#' Required Inputs: Attribute raw value (x), Lowest value (x_low), midpoint value (x_mid), highest value (x_high), Increment(1 = increasing, 2 = decreasing).
#'
#' Output: Linear SAVF curve with attribute plotted.

SAVF_lin_plot <- function(x, x_low, x_mid, x_high, increment = 1) {

  if (increment == 1) {
    x_desired <- x
    y_desired <- SAVF_linear_score(x, x_low, x_mid, x_high, increment = 1)
    x1 <- seq(x_low, x_mid, by = (x_mid - x_low) / 1000)
    x2 <- seq(x_mid, x_high, by = (x_high - x_mid) / 1000)
    v1 <- 0.5 * ((x1 - x_low) / (x_mid - x_low))
    v2 <- 0.5 + 0.5 * ((x2 - x_mid) / (x_high - x_mid))
    df <- data.frame(x = c(x1,x2), v = c(v1,v2))
    ggplot(df) +
      geom_line(aes(x,v)) +
      geom_point(aes(y = y_desired, x = x_desired),
                 size = 3, color = "blue") +
      xlab("Raw Value") + ylab("SAVF Score")
  } else {
    x_desired <- x
    y_desired <- SAVF_linear_score(x, x_low, x_mid, x_high, increment = 2)
    x1 <- seq(x_low, x_mid, by = (x_mid - x_low) / 1000)
    x2 <- seq(x_mid, x_high, by = (x_high - x_mid) / 1000)
    v1 <- 1 - 0.5 * ((x1 - x_low) / (x_mid - x_low))
    v2 <- 0.5 - 0.5 * ((x2 - x_mid) / (x_high - x_mid))
    df <- data.frame(x = c(x1,x2), v = c(v1,v2))
    ggplot(df) +
      geom_line(aes(x,v)) +
      geom_point(aes(y = y_desired, x = x_desired),
                 size = 3, color = "blue") +
      xlab("Raw Value") + ylab("SAVF Score")
  }
}
