#' Description: This function will take a matrix of SAVF scores and multiply it by the weights matrix to calculate the alternatives MAVF score.

#' Required Inputs: Matrix of SAVF scores (SAVF_matrix), numeric vector of SAVF weights, and vector or attributes names (names).

#' Output: MAVF Scores.
#'
#' @export

MAVF_Scores <- function(SAVF_matrix, weights, names){

  SAVF_matrix[is.na(SAVF_matrix)] <- 0

  MAVF = SAVF_matrix %*% weights
  value <- data.frame(names, MAVF)
  names(value) <- c("Name", "Score")
  value <- value[order(value$Score, decreasing = TRUE),]
  return(value)
}
