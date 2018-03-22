#'@title Multiple Attribute Value Function (MAVF) Breakout
#' 
#'@description: Takes a matrix of Single Attribute Value Function (SAVF) scores and shows the break out of each alternative's weighted SAVF scores.
#'The sum of the alternative's weighted SAVF scores is their MAVF score.
#' 
#'@param SAVF_matrix Matrix of SAVF scores
#'@param weights Numeric vector of SAVF weights
#'@param names Vector of attribute names
#' 
#'@return MAVF breakout graph
#'
#'@importFrom ggplot2 ggplot geom_bar coord_flip ylab xlab ggtitle
#'@importFrom dplyr %>% group_by quo
#'@importFrom stats reorder
#'@importFrom tidyr gather
#'
#'@examples
#'\dontrun{ 
#'
#'qbdata <- NFLcombine[1:7,]
#'
#'Height <- SAVF_exp_score(qbdata$heightinchestotal, 68, 75.21, 82)
#'Weight <- SAVF_exp_score(qbdata$weight, 185, 224.34, 275)
#'Forty <- SAVF_exp_score(qbdata$fortyyd, 4.3, 4.81, 5.4, increasing=FALSE)
#'Shuttle <- SAVF_exp_score(qbdata$twentyss, 3.8, 4.3, 4.9, increasing=FALSE)
#'Vertical <- SAVF_exp_score(qbdata$vertical, 21, 32.04, 40)
#'Broad <- SAVF_exp_score(qbdata$broad, 90, 111.24, 130)
#'Wonderlic <- SAVF_exp_score(qbdata$wonderlic, 0, 27.08, 50)
#'
#'SAVF_matrix = cbind(Height, Weight, Forty, Shuttle, 
#'                  Vertical, Broad, Wonderlic)
#'weights = c(0.096, 0.224, 0.092, 0.138, 0.152, 0.228, 0.07)
#'
#'MAVF_breakout(SAVF_matrix, weights, qbdata$name)}
#'
#'@export

MAVF_breakout <- function(SAVF_matrix, weights, names){
  
  if(class(SAVF_matrix) != "matrix") {
    stop('SAVF_matrix must be a matrix\n',
         'You have provided an object of the following class:\n', 
         'SAVF_matrix: ', class(SAVF_matrix), '\n')
  }
  
  if(class(weights) != "numeric") {
    stop('weights must be of class numeric\n',
         'You have provided an object of the following class:\n', 
         'weights: ', class(weights))
  }
  if(sum(weights)< 1) {
    warning('The sum of weights is less than 1')
  }
  
  if(sum(weights)> 1) {
    warning('The sum of weights is greater than 1')
  }
  
  if(ncol(SAVF_matrix) != length(weights)) {
    stop('The number of columns in the SAVF matrix must equal the length of the vector of weights')
  }
  
  if(nrow(SAVF_matrix) != length(names) ) {
    stop('The number of rows in the SAVF matrix must equal the length of the vector of names')
  }
  
  Measurement <- dplyr::quo(Measurement)
  Value <- dplyr::quo(Value)
  
  SAVF_matrix[is.na(SAVF_matrix)] <- 0
  SAVF <- t(SAVF_matrix) * weights
  MAVF = SAVF_matrix %*% weights
  value <- data.frame(names, MAVF, t(SAVF))

  `%>%` <- dplyr::`%>%`
  
  
  value %>%
    tidyr::gather(Measurement, Value, -c(1:2)) %>%
    dplyr::group_by(Measurement) %>%
    ggplot2::ggplot(ggplot2::aes(x = stats::reorder(names, MAVF), y = Value, fill = Measurement)) +
    ggplot2::geom_bar(stat = "identity") +
    ggplot2::coord_flip() +
    ggplot2::ylab("Weighted SAVF Scores") + ggplot2::xlab("Alternatives") +
    ggplot2::ggtitle("Breakout of Weighted SAVF")
}

