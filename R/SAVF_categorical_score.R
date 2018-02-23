#'@title Single Attribute Value Function (SAVF) Categorical Score
#'
#'@description: Calculates the Single Attribute Value Function (SAVF) score for a categorical value.
#'
#'@param x Attribute raw value
#'@param categories Vector of categories
#'@param weights Numeric vector of category weights
#'
#'@return Categorical SAVF Score
#'
#'@importFrom dplyr left_join mutate
#'
#'@examples
#'\dontrun{ SAVF_categorical_score("Tom", c("Tom", "Bill" ,"Jerry"), c(0.1, 0.25, 0.65))}
#'
#'@export

SAVF_categorical_score <- function(x, categories, weights){
  
  if(is.element(x, categories)==FALSE) {
    stop('Attribute raw value or vector of values, x, is not in the vector of categories')
  }
  
  if(sum(weights) < 1) {
    warning('Sum of weights is less than 1')
  }
  
  if(sum(weights) > 1) {
    warning('Sum of weights is greater than 1')
  }

  x <- data.frame(x)
  names(x) <- c("categories")
  df <- data.frame(categories, weights)
  combined <- sort(union(levels(x$categories), levels(df$categories)))
  value <- dplyr::left_join(dplyr::mutate(x, categories=factor(categories, levels=combined)),
                            dplyr::mutate(df, categories=factor(categories, levels=combined)),by="categories")
  return(value[,2])
}
