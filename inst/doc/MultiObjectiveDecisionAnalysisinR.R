## ----warning=FALSE, message=FALSE----------------------------------------
library(dplyr)
library(gridExtra)
library(knitr)

## ------------------------------------------------------------------------
qbdata <- MODA::NFLcombine %>%
    filter(year == '2011', position == 'QB', wonderlic != '0') %>%
  select(c(2, 8, 9, 12, 15, 17, 18, 25, 20))  
qbdata[qbdata == 0] = NA
names(qbdata) <- c("Name", "Height", "Weight", "Forty", 
                     "Shuttle", "Vertical", "Broad", "Wonderlic", "Round")

## ----echo=FALSE----------------------------------------------------------
knitr::kable(qbdata, caption = "Data")

## ----fig.cap="Value Hierarchy", fig.align='center', fig.width=7, fig.height=4----
branches<- as.data.frame(matrix(ncol=4,nrow=7))
names(branches)<-c("Level1","Level2","Level3","leaves")
branches[1,]<-rbind("QB","Elusiveness","Speed","Forty")
branches[2,]<-rbind("QB","Elusiveness","Agility","Shuttle")
branches[3,]<-rbind("QB","Size","","Height")
branches[4,]<-rbind("QB","Size","","Weight")
branches[5,]<-rbind("QB","Intelligence","","Wonderlic")
branches[6,]<-rbind("QB","Strength","Explosiveness","Vertical")
branches[7,]<-rbind("QB","Strength","Power","Broad")

MODA::value_hierarchy_tree(branches$Level1,branches$Level2,branches$Level3,
leaves=branches$leaves, nodefillcolor = "LightBlue", leavesfillcolor = "Blue", leavesfontcolor = "White")


## ----warning=FALSE, fig.asp=.75, fig.align='center',fig.width=6, fig.height=5----
a1 <- MODA::SAVF_exp_plot(90, 0, 120, 150)
a2 <- MODA::SAVF_linear_plot(10, 0, 20, 100, FALSE)
a3 <- MODA::SAVF_cat_plot(c("Tom", "Bill", "Jerry"), c(0.1, 0.25, 0.65))
gridExtra::grid.arrange(a1, a2, a3, ncol = 2)

## ------------------------------------------------------------------------
Height <- round(MODA::SAVF_exp_score(qbdata$Height , 68, 75.21, 82), 3)
Weight <- round(MODA::SAVF_exp_score(qbdata$Weight, 185, 224.34, 275), 3)
Forty <- round(MODA::SAVF_exp_score(qbdata$Forty, 4.3, 4.81, 5.4, FALSE), 3)
Shuttle <- round(MODA::SAVF_exp_score(qbdata$Shuttle, 3.8, 4.3, 4.9, FALSE), 3)
Vertical <- round(MODA::SAVF_exp_score(qbdata$Vertical, 21, 32.04, 40), 3)
Broad <- round(MODA::SAVF_exp_score(qbdata$Broad, 90, 111.24, 130), 3)
Wonderlic <- round(MODA::SAVF_exp_score(qbdata$Wonderlic, 0, 27.08, 50), 3)

SAVF_matrix = cbind(qbdata$Name, Height, Weight, Forty, Shuttle, 
                    Vertical, Broad, Wonderlic)
SAVF_matrix[is.na(SAVF_matrix)] <- 0

knitr::kable(SAVF_matrix, caption = "SAVF Scores")

## ---- fig.align='center', fig.cap="Weighted Value Hierarchy",fig.width=7, fig.height=4----
branches<- as.data.frame(matrix(ncol=5,nrow=7))
names(branches)<-c("Level1","Level2","Level3","leaves","weights")
branches[1,]<-rbind("QB","Elusiveness","Speed","Forty","0.092")
branches[2,]<-rbind("QB","Elusiveness","Agility","Shuttle","0.138")
branches[3,]<-rbind("QB","Size","","Height","0.096")
branches[4,]<-rbind("QB","Size","","Weight","0.224")
branches[5,]<-rbind("QB","Intelligence","","Wonderlic","0.07")
branches[6,]<-rbind("QB","Strength","Explosiveness","Vertical","0.152")
branches[7,]<-rbind("QB","Strength","Power","Broad","0.228")

MODA::value_hierarchy_tree(branches$Level1,branches$Level2,branches$Level3,
leaves=branches$leaves,weights=branches$weights, nodefillcolor = "LightBlue", leavesfillcolor = "Blue", leavesfontcolor = "White")

## ------------------------------------------------------------------------
Height <- round(MODA::SAVF_exp_score(qbdata$Height , 68, 75.21, 82), 3)
Weight <- round(MODA::SAVF_exp_score(qbdata$Weight, 185, 224.34, 275), 3)
Forty <- round(MODA::SAVF_exp_score(qbdata$Forty, 4.3, 4.81, 5.4, FALSE), 3)
Shuttle <- round(MODA::SAVF_exp_score(qbdata$Shuttle, 3.8, 4.3, 4.9, FALSE), 3)
Vertical <- round(MODA::SAVF_exp_score(qbdata$Vertical, 21, 32.04, 40), 3)
Broad <- round(MODA::SAVF_exp_score(qbdata$Broad, 90, 111.24, 130), 3)
Wonderlic <- round(MODA::SAVF_exp_score(qbdata$Wonderlic, 0, 27.08, 50), 3)

SAVF_matrix = cbind(Height, Weight, Forty, Shuttle, 
                    Vertical, Broad, Wonderlic)
weights = c(0.096, 0.224, 0.092, 0.138, 0.152, 0.228, 0.07)
names = qbdata$Name

MAVF <- MODA::MAVF_Scores(SAVF_matrix, weights, names)
knitr::kable(MAVF, digits = 4, row.names = FALSE, caption = "MAVF Scores")

## ----fig.asp=.75, fig.align='center', fig.cap="MAVF Breakout Graph", fig.width=6, fig.height=5----
Height <- MODA::SAVF_exp_score(qbdata$Height, 68, 75.21, 82, 1)
Weight <- MODA::SAVF_exp_score(qbdata$Weight, 185, 224.34, 275, 1)
Forty <- MODA::SAVF_exp_score(qbdata$Forty, 4.3, 4.81, 5.4, 2)
Shuttle <- MODA::SAVF_exp_score(qbdata$Shuttle, 3.8, 4.3, 4.9, 2)
Vertical <- MODA::SAVF_exp_score(qbdata$Vertical, 21, 32.04, 40, 1)
Broad <- MODA::SAVF_exp_score(qbdata$Broad, 90, 111.24, 130, 1)
Wonderlic <- MODA::SAVF_exp_score(qbdata$Wonderlic, 0, 27.08, 50, 1)
  
SAVF_matrix = cbind(Height, Weight, Forty, Shuttle, 
                      Vertical, Broad, Wonderlic)
weights = c(0.096, 0.224, 0.092, 0.138, 0.152, 0.228, 0.07)
names = qbdata$Name

MODA::MAVF_breakout(SAVF_matrix, weights, names)

## ----fig.asp=.8, fig.align='center', fig.cap="Sensitivity Analysis", fig.width=6, fig.height=5----
Height <- round(MODA::SAVF_exp_score(qbdata$Height , 68, 75.21, 82), 3)
Weight <- round(MODA::SAVF_exp_score(qbdata$Weight, 185, 224.34, 275), 3)
Forty <- round(MODA::SAVF_exp_score(qbdata$Forty, 4.3, 4.81, 5.4, FALSE), 3)
Shuttle <- round(MODA::SAVF_exp_score(qbdata$Shuttle, 3.8, 4.3, 4.9, FALSE), 3)
Vertical <- round(MODA::SAVF_exp_score(qbdata$Vertical, 21, 32.04, 40), 3)
Broad <- round(MODA::SAVF_exp_score(qbdata$Broad, 90, 111.24, 130), 3)
Wonderlic <- round(MODA::SAVF_exp_score(qbdata$Wonderlic, 0, 27.08, 50), 3)

SAVF_matrix = cbind(Height, Weight, Forty, Shuttle, 
                    Vertical, Broad, Wonderlic)
  
weights = c(0.096, 0.224, 0.092, 0.138, 0.152, 0.228, 0.07)

MODA::sensitivity_plot(SAVF_matrix, weights, qbdata$Name, 4)

