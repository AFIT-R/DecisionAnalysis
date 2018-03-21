#' @importFrom stats runif

.onAttach <- function(...) {
  
  # If interactive, hide message
  # o.w. check against rng seed.
  if (!interactive() || stats::runif(1) > 0.5){
    return()
  }
  
  # Display hint
  packageStartupMessage( "To see the user guide use `browseVignettes('DecisionAnalysis')`")
}