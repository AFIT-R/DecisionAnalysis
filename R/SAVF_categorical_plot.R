#'@title Single Attribute Value Function (SAVF) Categorical Plot
#' 
#'@description: Plots the categorical Single Attribute Value Function (SAVF) graph. Categories may be any value, but category scores must be numeric. 
#'The function checks to ensure the total of scores sums to one.
#'
#'@param categories Vector of categories
#'@param scores Numeric vector of catgory scores
#'@param fillcolor Fill color for the chart, default is blue
#' 
#'@return Categorical SAVF graph
#'
#'@importFrom ggplot2 ggplot geom_bar xlab ylab aes
#'@importFrom stats reorder
#'
#'@examples
#'\dontrun{ SAVF_cat_plot(c("Tom", "Bill" ,"Jerry"), c(0.1, 0.25, 0.65))}
#'
#'@export

SAVF_cat_plot <- function(categories, scores, fillcolor = "blue") {

  x = categories
  v = scores
  if (sum(v) != 1) {
    stop("Sum of scores must equal 1", call. = FALSE)
  }

  df <- data.frame(x = x, v = v)
  ggplot2::ggplot(df, ggplot2::aes(x = stats::reorder(categories, scores), v)) +
    ggplot2::geom_bar(stat = "identity", fill = fillcolor) +
    ggplot2::xlab("Category") + ggplot2::ylab("SAVF Score")
}
