#'@title Sensitivity Analysis Graph
#' 
#'@description Takes a matrix of Single Attribute Value Function (SAVF) scores and shows how each alternative's 
#'MAVF scores change as the weight for that criteria changes from zero to one. The vertical black line represents the current weight.
#'
#'@param SAVF_matrix Matrix of SAVF scores
#'@param weights Numeric vector of SAVF weights
#'@param names The names of the alternatives
#'@param criteria Numeric value equal to the column number of the SAVF_matrix that contains the desired criteria to conduct sensitivity analysis on
#'@param title True=The title is the column name associated with the selected criteria, False=no title, Default: TRUE
#'
#'
#'@return Sensitivity Analysis graph
#'
#'@importFrom ggplot2 ggplot geom_line ylab xlab geom_vline aes labs
#'@importFrom dplyr %>% quo
#'@importFrom tidyr gather
#'
#'@examples
#'\dontrun{ 
#'
#'library(dplyr)
#'
#'qbdata <- NFLcombine %>%
#'  filter(year == '2011', position == 'QB', wonderlic != '0') %>%
#'  select(c(2, 8, 9, 12, 15, 17, 18, 25, 20))  
#'qbdata[qbdata == 0] = NA
#'
#'Height <- SAVF_exp_score(qbdata$heightinchestotal, 68, 75.21, 82)
#'Weight <- SAVF_exp_score(qbdata$weight, 185, 224.34, 275)
#'Forty <- SAVF_exp_score(qbdata$fortyyd, 4.3, 4.81, 5.4, increasing=FALSE)
#'Shuttle <- SAVF_exp_score(qbdata$twentyss, 3.8, 4.3, 4.9, increasing=FALSE)
#'Vertical <- SAVF_exp_score(qbdata$vertical, 21, 32.04, 40)
#'Broad <- SAVF_exp_score(qbdata$broad, 90, 111.24, 130)
#'Wonderlic <- SAVF_exp_score(qbdata$wonderlic, 0, 27.08, 50)
#'
#'SAVF_matrix = cbind(Height, Weight, Forty, Shuttle, Vertical, Broad, Wonderlic)
#'weights = c(0.096, 0.224, 0.092, 0.138, 0.152, 0.228, 0.07)
#'
#'sensitivity_plot(SAVF_matrix, weights, qbdata$name, 4)
#'}
#'
#'@export

sensitivity_plot <- function(SAVF_matrix, weights, names, criteria, title=TRUE){
  
  #initialize variables used later on
  Names <- dplyr::quo(Names)
  Weight <- dplyr::quo(Weight)
  Value <- dplyr::quo(Value)
  
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
  
  if((class(criteria) != "numeric") | (criteria > nrow(SAVF_matrix)) ) {
    stop('criteria must be a column number of the SAVF_Matrix')
  }
  
  SAVF_matrix[is.na(SAVF_matrix)] <- 0
  i <- criteria
  x <- seq(0, 1, by = .1)
  m <- matrix(NA, nrow = length(weights), ncol = 11)
  
  
  m<-sapply(1:length(weights), function(j) m[j,]<-(1 - x)*(weights[j] / (1 - weights[i])))
  m<-t(m)
  m[i,] <- x
  M <- data.frame(MAVF_Scores(SAVF_matrix, m, names))
  names(M) <- c("Names", x)
  
  `%>%` <- dplyr::`%>%`
  
  M %>%
    tidyr::gather(Weight, Value, -c(1)) %>%
    ggplot2::ggplot(ggplot2::aes(x = as.numeric(Weight), y = Value,
               group = Names, colour = Names)) +
    ggplot2::geom_line() + ggplot2::geom_vline(xintercept = weights[i]) +
    ggplot2::ylab("MAVF Score") + ggplot2::xlab("Weight") +
    if (title==TRUE){
    ggplot2::labs(title= colnames(SAVF_matrix)[criteria])
    }
}
