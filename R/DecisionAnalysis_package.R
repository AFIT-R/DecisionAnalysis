#' DecisionAnalysis: Multi-Objective Decision Analysis
#'
#' The DecisionAnalysis package contains all of the necessary functions required to plot weighted and unweighted value hierarchy trees, calculate and plot linear, exponential, and categorical single attribute value functions, 
#' calculate and graph multi value attribute functions, and conduct sensitivity analysis.
#' 
#' Start with the vignette to learn more about using the DecisionAnalysis package:
#' browseVignettes(package = "DecisionAnalysis")
#'
#' @examples 
#'
#'#Create a value hierarchy tree
#'branches<- as.data.frame(matrix(ncol=5,nrow=7))
#'names(branches)<-c("Level1","Level2","Level3","leaves","weights")
#'branches[1,]<-rbind("QB","Elusiveness","Speed","Forty","0.092")
#'branches[2,]<-rbind("QB","Elusiveness","Agility","Shuttle","0.138")
#'branches[3,]<-rbind("QB","Size","","Height","0.096")
#'branches[4,]<-rbind("QB","Size","","Weight","0.224")
#'branches[5,]<-rbind("QB","Intelligence","","Wonderlic","0.07")
#'branches[6,]<-rbind("QB","Strength","Explosiveness","Vertical","0.152")
#'branches[7,]<-rbind("QB","Strength","Power","Broad","0.228")
#'value_hierarchy_tree(branches$Level1,branches$Level2,branches$Level3,
#'leaves=branches$leaves,weights=branches$weights)
#' 
#' 
#'#subset NFLcombine data from DecisionAnalysis package
#'qbdata <- NFLcombine[1:7,]
#'
#'#Create SAVF_matrix
#'Height <- SAVF_exp_score(qbdata$heightinchestotal, 68, 75.21, 82)
#'Weight <- SAVF_exp_score(qbdata$weight, 185, 224.34, 275)
#'Forty <- SAVF_exp_score(qbdata$fortyyd, 4.3, 4.81, 5.4, increasing=FALSE)
#'Shuttle <- SAVF_exp_score(qbdata$twentyss, 3.8, 4.3, 4.9, increasing=FALSE)
#'Vertical <- SAVF_exp_score(qbdata$vertical, 21, 32.04, 40)
#'Broad <- SAVF_exp_score(qbdata$broad, 90, 111.24, 130)
#'Wonderlic <- SAVF_exp_score(qbdata$wonderlic, 0, 27.08, 50)
#'SAVF_matrix = cbind(Height, Weight, Forty, Shuttle, Vertical, Broad, Wonderlic)
#'
#'#Create weights vector
#'weights = c(0.096, 0.224, 0.092, 0.138, 0.152, 0.228, 0.07)
#'
#'#Calculate MAVF Score
#'MAVF_Scores(SAVF_matrix, weights, qbdata$name)
#'
#'#Plot MAVF Breakout
#'MAVF_breakout(SAVF_matrix, weights, qbdata$name)
#'
#'#Plot sensitivity analysis for shuttle criteria
#'sensitivity_plot(SAVF_matrix, weights, qbdata$name, 4)
#'
#'@seealso
#'
#'Report bugs at https://github.com/AFIT-R/DecisionAnalysis
#'
"_PACKAGE"
#> [1] "_PACKAGE"

#'@useDynLib DecisionAnalysis
#'@importFrom Rcpp evalCpp
NULL