branches<- as.data.frame(matrix(ncol=5,nrow=7))
names(branches)<-c("Level1","Level2","Level3","Leaf","Weight")
branches[1,]<-rbind("QB","Elusiveness","Speed","Forty","0.092")
branches[2,]<-rbind("QB","Elusiveness","Agility","Shuttle","0.138")
branches[3,]<-rbind("QB","Size","","Height","0.096")
branches[4,]<-rbind("QB","Size","","Weight","0.224")
branches[5,]<-rbind("QB","Intelligence","","Wonderlic","0.07")
branches[6,]<-rbind("QB","Strength","Explosiveness","Vertical","0.152")
branches[7,]<-rbind("QB","Strength","Power","Broad","0.228")


test_that("value_hierarchy_tree provides proper messages and warnings",{
  expect_error(value_hierarchy_tree(branches$Level1,branches$Level2,branches$Level3,leaves=c(1,2,3,4,5,6,7),weights=branches$Weight))
  expect_error(value_hierarchy_tree(branches$Level1,branches$Level2,branches$Level3,leaves=c("Forty","Shuttle","Height","Weight","Wonderlic","Vertical",""),weights=branches$Weight))
})


