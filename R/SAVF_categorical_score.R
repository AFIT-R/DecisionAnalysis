#' Description: This function will calculate the SAVF score for a categorical value.

#' Required Inputs: Attribute raw value or vector or values (x), vector of categories (categories) and numeric vector of category weights (weights).

#' Output: Categorical SAVF Score.

SAVF_categorical_score <- function(x, categories, weights){

  x <- data.frame(x)
  names(x) <- c("categories")
  df <- data.frame(categories, weights)
  value <- left_join(x , df, by = "categories")
  return(value[,2])
}
