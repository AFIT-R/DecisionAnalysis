#' Description: This function will take a matrix of SAVF scores and show how each alternatives MAVF scores change as the weight for that criteria changes from zero to one. The vertical black line represents the current weight.

#' Required Inputs: Matrix of SAVF scores (SAVF_matrix), numeric vector of SAVF weights, the alternativenames (names), and which criteria to conduct sensitivity analysis on (criteria).

#' Output: Sensitivity Analysis graph
#'
#' @export


sensitivity_plot <- function(SAVF_matrix, weights, names, criteria){

  SAVF_matrix[is.na(SAVF_matrix)] <- 0
  i <- criteria
  x <- seq(0, 1, by = .1)
  m <- matrix(NA, nrow = length(weights), ncol = 11)

  for (j in 1:length(weights)){
    m[j,] <- (1 - x)*(weights[j] / (1 - weights[i]))
    m[i,] <- x
    M <- data.frame(MAVF_Scores(SAVF_matrix, m, names))
    names(M) <- c("Names",x)}

  M %>%
    gather(Weight, Value, 2:length(M)) %>%
    ggplot(aes(x = as.numeric(Weight), y = Value,
               group = Names, colour = Names)) +
    geom_line() + geom_vline(xintercept = weights[i]) +
    ylab("MAVF Score") + xlab("Weight")
}
