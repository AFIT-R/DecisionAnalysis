#' Description: This function will take a matrix of SAVF scores and show the break out of each alternatives weighted SAVF scores who’s sum is their MAVF score.

#' Required Inputs: Matrix of SAVF scores (SAVF_matrix), numeric vector of SAVF weights, and vector or attributes names (names).

#' Output: MAVF breakout graph

MAVF_breakout <- function(SAVF_matrix, weights, names){

  SAVF_matrix[is.na(SAVF_matrix)] <- 0
  SAVF <- t(SAVF_matrix) * weights
  MAVF = SAVF_matrix %*% weights
  value <- data.frame(names, MAVF, t(SAVF))

  value %>%
    gather(Measurement, Value, -c(1, 2)) %>%
    group_by(Measurement) %>%
    ggplot(aes(x = reorder(names, MAVF), y = Value, fill = Measurement)) +
    geom_bar(stat = "identity") +
    coord_flip() +
    ylab("Weighted SAVF Scores") + xlab("Alternatives") +
    ggtitle("Breakout of Weighted SAVF")
}
