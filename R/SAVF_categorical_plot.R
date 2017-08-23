#' Description: This function will plot the categorical SAVF graph. Categories may be any value, but category scores must be numeric. The function checks to ensure the total of scores sums to one.
#'
#' Required Inputs: Vector of categories (categories) and numeric vector of category scores (scores).
#'
#' Output: Categorical SAVF graph.
#'
#' @export

SAVF_cat_plot <- function(categories, scores) {

  x = categories
  v = scores
  if (sum(v) != 1) {
    stop("Percent total must equal 1", call. = FALSE)
  }

  df <- data.frame(x = x, v = v)
  ggplot(df, aes(x = reorder(categories, scores), v)) +
    geom_bar(stat = "identity", fill = "blue") +
    xlab("Category") + ylab("SAVF Score")
}
