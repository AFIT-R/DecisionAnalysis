#' MODA: Multi-Objective Decision Analysis
#'
#' The MODA package contains all of the necessary functions required to calculate and plot linear, exponential, and categorical single attribute value functions, 
#' calculate and graph multi value attribute functions, and conduct sensitivity analysis.
#'
#' @examples 
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
#'MAVF_Scores(SAVF_matrix, weights, qbdata$name)
#'
#'MAVF_breakout(SAVF_matrix, weights, qbdata$name)
#'
#'sensitivity_plot(SAVF_matrix, weights, qbdata$name, 4)
#'
#'
#'@references
#'https://rpubs.com/jdeehr/300421
#'
"_PACKAGE"
#> [1] "_PACKAGE"

#'@useDynLib MODA
#'@importFrom Rcpp evalCpp
NULL