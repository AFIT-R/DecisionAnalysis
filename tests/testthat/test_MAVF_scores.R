SAVF_matrix <- as.data.frame(matrix(ncol=7,nrow=8))
names(SAVF_matrix)<-c("Height","Weight","Forty","Shuttle","Vertical","Broad","Wonderlic")
SAVF_matrix[1,]<-rbind(0.414,0.45,0.473,0.366,0.553,0.395,0.839)
SAVF_matrix[2,]<-rbind(0.557,0.607,0.688,0.537,0.582,0.726,0.817)
SAVF_matrix[3,]<-rbind(0.414,0.552,0.669,0.7,0.611,0.621,0.664)
SAVF_matrix[4,]<-rbind(0.557,0.485,0.446,0.383,0.525,0.469,0.56)
SAVF_matrix[5,]<-rbind(0.414,0.391,0.482,0.528,0.367,0.37,0.539)
SAVF_matrix[6,]<-rbind(0.775,0.8,0.128,0,0.117,0,0.478)
SAVF_matrix[7,]<-rbind(0.629,0.751,0.737,0.613,0.67,0.888,0.38)
SAVF_matrix[8,]<-rbind(0.485,0.574,0.786,0.671,0.67,0.596,0.36)

weights2 <- as.data.frame(matrix(ncol=7,nrow=1))
weights2[1,]<-rbind(0.414,0.45,0.473,0.366,0.553,0.395,0.839)

weights = c(0.096, 0.224, 0.092, 0.138, 0.152, 0.228, 0.07)
names = c("Greg McElroy","Blaine Gabbert","Christian Ponder","Ricky Stanzi","Andy Dalton","Ryan Mallett","Cam Newton","Jack Locker")

test_that("MAVF_scores provides proper messages and warnings",{
  expect_error(MAVF_Scores(SAVF_matrix, weights, names))
  SAVF_matrix<-as.matrix(SAVF_matrix)
  expect_error(MAVF_scores(SAVF_matrix,weights2,names))
  expect_error(MAVF_scores(SAVF_matrix,weights=SAVF_matrix,names))
  expect_error(MAVF_Scores(SAVF_matrix[,1:6], weights, names))
  expect_error(MAVF_Scores(SAVF_matrix, weights, c("Greg McElroy","Blaine Gabbert","Christian Ponder")))
  expect_warning(MAVF_Scores(SAVF_matrix, c(0.096, 0.224, 0.092, 0.138, 0.150, 0.220, 0.05), names))
  expect_warning(MAVF_Scores(SAVF_matrix, c(0.096, 0.224, 0.092, 0.155, 0.175, 0.228, 0.15), names))
  expect_error(MAVF_Scores(SAVF_matrix, c("0.096", "0.224", "0.092", "0.138", "0.152", "0.228", "0.07"), names))
})

SAVF_matrix<-as.matrix(SAVF_matrix)

test_that("MAVF_scores has correct dimensions and output type",{
  expect_is(MAVF_Scores(SAVF_matrix, weights, names),"data.frame")
  expect_length(MAVF_Scores(SAVF_matrix, weights, names),2)
})


test1answer <- as.data.frame(matrix(ncol=2,nrow=8))
names(test1answer)<-c("Name","Score")
test1answer[1,]<-rbind("Cam Newton","0.711910")
test1answer[2,]<-rbind("Blaine Gabbert","0.638024")
test1answer[3,]<-rbind("Jack Locker","0.602974")
test1answer[4,]<-rbind("Christian Ponder","0.602480")
test1answer[5,]<-rbind("Ricky Stanzi","0.481930")
test1answer[6,]<-rbind("Greg McElroy","0.467414")
test1answer[7,]<-rbind("Andy Dalton","0.422410")
test1answer[8,]<-rbind("Ryan Mallett","0.316620")

test_that("MAVF_Scores computes correctly",{
  expect_equivalent(as.matrix(MAVF_Scores(SAVF_matrix, weights, names)),as.matrix(test1answer))
})