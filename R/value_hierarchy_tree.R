#'@title Value Hierarchy Tree
#'
#'@description: Plots a value hierarchy tree with weights on the leaves (end nodes)
#'
#'@param ... One or more character vectors containing a single level of nodes. The character vector containing the end nodes should not be entered here. 
#'If there isn't a node for a level of the branch, it should be entered as ""
#'@param leaves Character vector of values containing the last node of the branches
#'@param weights Character or numeric vector of weights associated with the end node of the branches
#'@param nodestyle Style of the nodes
#'@param nodeshape Shape of the nodes. Polygon, ellipse, circle, box, etc.
#'@param nodefillcolor Fill color of the nodes
#'@param nodefontname Font of the nodes
#'@param nodefontcolor Font color of the nodes
#'@param leavesshape Shape of the leaves
#'@param leavesfillcolor Fill color of the leaves
#'@param leavesfontname Font of the leaves
#'@param leavesfontcolor Font color of the leaves
#'
#'@return Value hierarchy tree plot
#'
#'@importFrom data.tree as.Node SetNodeStyle Do
#'@importFrom graphics plot
#'
#'@examples
#'\dontrun{ branches<- as.data.frame(matrix(ncol=5,nrow=7))
#'names(branches)<-c("Level1","Level2","Level3","leaves","weights")
#'branches[1,]<-rbind("QB","Elusiveness","Speed","Forty","0.092")
#'branches[2,]<-rbind("QB","Elusiveness","Agility","Shuttle","0.138")
#'branches[3,]<-rbind("QB","Size","","Height","0.096")
#'branches[4,]<-rbind("QB","Size","","Weight","0.224")
#'branches[5,]<-rbind("QB","Intelligence","","Wonderlic","0.07")
#'branches[6,]<-rbind("QB","Strength","Explosiveness","Vertical","0.152")
#'branches[7,]<-rbind("QB","Strength","Power","Broad","0.228")
#'
#'value_hierarchy_tree(branches$Level1,branches$Level2,branches$Level3,
#'leaves=branches$leaves,weights=branches$weights)
#'}
#'
#'@export


value_hierarchy_tree<-function(...,leaves,weights, 
                         nodestyle="filled, rounded",nodeshape="box",nodefillcolor="white",nodefontname="helvetica",nodefontcolor="black",
                         leavesshape="egg",leavesfillcolor="gray",leavesfontcolor="black", leavesfontname = "helvetica"){
  
  if(class(leaves) != "character") {
    stop(
         'leaves must be a character vector\n',
         'You have provided an object of the following class:\n', 
         'leaves: ', class(leaves), '\n')
  }

  
  if(!is.na(match("",leaves))) {
    stop('All end nodes must be in the leaves vector')
  }
  

  treebranches<- matrix(NA, nrow = length(weights), ncol = 1)
  treebranches<- as.data.frame(treebranches)
  colnames(treebranches)<-"pathString"
  
  leavesweightss<-paste0(leaves,"\n","(",weights,")")
  treebranches$pathString<-paste(...,leavesweightss,sep="/")
  
  treebranches$pathString<-gsub("//{2,}", "//",treebranches$pathString)
  
  finaltree<-data.tree::as.Node(treebranches)
  
  
  data.tree::SetNodeStyle(finaltree, style = nodestyle, shape = nodeshape, 
                          fontcolor = nodefontcolor,
                          fillcolor = nodefillcolor, 
                          fontname = nodefontname, tooltip=data.tree::GetDefaultTooltip)
  
  data.tree::Do(finaltree$leaves, 
     function(node) data.tree::SetNodeStyle(node, shape = leavesshape, 
                                 fillcolor = leavesfillcolor, fontcolor = leavesfontcolor, fontname = leavesfontname))
  
  graphics::plot(finaltree)
  
}

