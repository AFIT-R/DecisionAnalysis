#'@title Value Hierarchy Tree
#'
#'@description: Plots a value hierarchy tree
#'
#'@param ... One or more character vectors containing a single level of nodes. The character vector containing the end nodes should not be entered here. 
#'If there isn't a node for a level of the branch, it should be entered as ""
#'@param leaves Character vector of values containing the last node of the branches
#'@param weights Character or numeric vector of weights associated with the end node of the branches (Optional)
#'@param nodestyle Style of the nodes, default is filled, rounded
#'@param nodeshape Shape of the nodes, default is box
#'@param nodefillcolor Fill color of the nodes, default is white
#'@param nodefontname Font of the nodes, default is helvetica
#'@param nodefontcolor Font color of the nodes, default is black
#'@param leavesshape Shape of the leaves, default is egg
#'@param leavesfillcolor Fill color of the leaves, default is gray
#'@param leavesfontname Font of the leaves, default is helvetica
#'@param leavesfontcolor Font color of the leaves, default is black
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


value_hierarchy_tree <- function(...,leaves,weights, 
                         nodestyle="filled, rounded",nodeshape="box",nodefillcolor="white",nodefontname="helvetica",nodefontcolor="black",
                         leavesshape="egg",leavesfillcolor="gray",leavesfontcolor="black", leavesfontname = "helvetica"){
  
  #Check if leaves is character
  if(class(leaves) != "character") {
    stop(
         'leaves must be a character vector\n',
         'You have provided an object of the following class:\n', 
         'leaves: ', class(leaves), '\n')
  }

  #Check if any end nodes are not in the leaves vector
  if(!is.na(match("",leaves))) {
    stop('All end nodes must be in the leaves vector')
  }
  
  #initialize treebranches matrix for use in as.Node function
  treebranches <- matrix(NA, nrow = length(leaves), ncol = 1)
  treebranches <- as.data.frame(treebranches)
  colnames(treebranches) <- "pathString"
  
  #Check if weights input was provided. If provided, then combine weights and end nodes into one string
  if(missing(weights)) {
    leavesweights <- leaves
  } else {
    leavesweights <- paste0(leaves,"\n","(",weights,")")
  }
  
  #Transform inputs into format for as.Node function
  treebranches$pathString <- paste(...,leavesweights,sep="/")
  
  #Replace all instances of more than one slash (/) with just one slash (/)
  treebranches$pathString <- gsub("//{2,}", "//",treebranches$pathString)
  
  #Create value hierarchy tree
  finaltree<-data.tree::as.Node(treebranches)
  
  #set node style for plot
  data.tree::SetNodeStyle(finaltree, style = nodestyle, shape = nodeshape, 
                          fontcolor = nodefontcolor,
                          fillcolor = nodefillcolor, 
                          fontname = nodefontname, tooltip=data.tree::GetDefaultTooltip)
  
  #set leaves style for plot
  data.tree::Do(finaltree$leaves, 
     function(node) data.tree::SetNodeStyle(node, shape = leavesshape, 
                                 fillcolor = leavesfillcolor, fontcolor = leavesfontcolor, fontname = leavesfontname))
  #plot value hierarchy tree
  graphics::plot(finaltree)
  
}

