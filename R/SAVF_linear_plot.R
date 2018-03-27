#' @title Single Attribute Value Function (SAVF) Linear Plot
#' 
#' @description: Plots the linear Single Attribute Value Function (SAVF) graph for an increasing or decreasing function. 
#' It calls the SAVF_linear_score function to calculate the score based on the midpoint value method and plots it with a blue dot.
#'
#' @param x Attribute raw value
#' @param x_low Lowest value
#' @param x_mid Midpoint value
#' @param x_high Highest value
#' @param increasing TRUE=increasing, FALSE=decreasing, Default: TRUE
#' 
#' @return Linear SAVF curve with attribute plotted
#' 
#' @importFrom ggplot2 ggplot geom_line geom_point xlab ylab
#' @importFrom dplyr quo
#' 
#' @examples
#'\dontrun{ SAVF_linear_plot(10, 0, 25, 100, FALSE)}
#'
#' @export

SAVF_linear_plot <- function(x, x_low, x_mid, x_high, increasing = TRUE) {

  if(x_low >x_high | x_low>x_mid) {
    stop('The input for x_low exceeds either x_mid or x_high')
  }
  if(x_high<x_mid) {
    stop('The input for x_mid exceeds x_high')
  }
  
  v <- dplyr::quo(v)
  
  if (increasing == TRUE) {
    x_desired <- x
    y_desired <- SAVF_linear_score(x, x_low, x_mid, x_high, increasing = TRUE)
    x1 <- seq(x_low, x_mid, by = (x_mid - x_low) / 1000)
    x2 <- seq(x_mid, x_high, by = (x_high - x_mid) / 1000)
    v1 <- 0.5 * ((x1 - x_low) / (x_mid - x_low))
    v2 <- 0.5 + 0.5 * ((x2 - x_mid) / (x_high - x_mid))
    df <- data.frame(x = c(x1,x2), v = c(v1,v2))
    ggplot2::ggplot(df) +
      ggplot2::geom_line(aes(x,v)) +
      ggplot2::geom_point(aes(y = y_desired, x = x_desired),
                 size = 3, color = "blue") +
      ggplot2::xlab("Raw Value") + ggplot2::ylab("SAVF Score")
  } else {
    x_desired <- x
    y_desired <- SAVF_linear_score(x, x_low, x_mid, x_high, increasing = FALSE)
    x1 <- seq(x_low, x_mid, by = (x_mid - x_low) / 1000)
    x2 <- seq(x_mid, x_high, by = (x_high - x_mid) / 1000)
    v1 <- 1 - 0.5 * ((x1 - x_low) / (x_mid - x_low))
    v2 <- 0.5 - 0.5 * ((x2 - x_mid) / (x_high - x_mid))
    df <- data.frame(x = c(x1,x2), v = c(v1,v2))
    ggplot2::ggplot(df) +
      ggplot2::geom_line(aes(x,v)) +
      ggplot2::geom_point(aes(y = y_desired, x = x_desired),
                 size = 3, color = "blue") +
      ggplot2::xlab("Raw Value") + ggplot2::ylab("SAVF Linear Score")
  }
}
