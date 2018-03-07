#'@title Single Attribute Value Function (SAVF) Exponential Plot
#'
#'@description: Plots an increasing or decreasing exponential Single Attribute Value Function (SAVF) curve. 
#'It calls the SAVF_calc_rho and SAVF_exp_score functions and plots your score on the curve with a blue dot.
#'
#'@param x Attribute raw value
#'@param x_low Lowest Value
#'@param x_mid Midpoint value
#'@param x_high Highest value
#'@param increasing TRUE=increasing, FALSE=decreasing, Default: TRUE
#'
#'@details 
#'For Z=((x_mid - x_low) / (x_high - x_low)),
#'Z can not be in (0.51,0.49)
#'
#'@return Exponential SAVF curve with attribute plotted
#'
#'@importFrom ggplot2 ggplot geom_line xlab ylab geom_point aes
#'
#'@examples
#'\dontrun{ SAVF_exp_plot(90, 0, 120, 150)}
#'
#'@export

SAVF_exp_plot <- function(x, x_low, x_mid, x_high, increasing = TRUE) {
  
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

  if (increasing == TRUE){
    rho <- SAVF_calc_rho(x_low, x_mid, x_high, increasing = TRUE)
    x_desired <- x
    y_desired <- SAVF_exp_score(x, x_low, x_mid, x_high, increasing = TRUE)
    x <- seq(x_low, x_high, by = (x_high - x_low)/1000)
    v <- SAVF_exp_score(x, x_low, x_mid, x_high, increasing = TRUE)
    df <- data.frame(x = x, v = v)
    ggplot2::ggplot(df, ggplot2::aes(x,v)) +
      ggplot2::geom_line() +
      ggplot2::geom_point(ggplot2::aes(y = y_desired, x = x_desired), size = 3,
                 color = "blue") +
      ggplot2::xlab("Raw Value") + ggplot2::ylab("SAVF Score")
  } else {
    rho <- SAVF_calc_rho(x_low, x_mid, x_high, increasing = FALSE)
    x_desired <- x
    y_desired <- SAVF_exp_score(x, x_low, x_mid, x_high, increasing = FALSE)
    x <- seq(x_low, x_high, by = (x_high - x_low)/1000)
    v <- SAVF_exp_score(x, x_low, x_mid, x_high, increasing = FALSE)
    df <- data.frame(x = x, v = v)
    ggplot2::ggplot(df, ggplot2::aes(x,v)) +
      ggplot2::geom_line() +
      ggplot2::geom_point(aes(y = y_desired, x = x_desired), size = 3,
                 color = "blue") +
      ggplot2::xlab("Raw Value") + ggplot2::ylab("SAVF Exponential Score")
  }
}
