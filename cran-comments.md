<!-- cran-comments.md is generated from cran-comments.Rmd. Please edit that file -->
Test environments
-----------------

-   local win install, R 3.4.3
-   ubuntu 14.04.5 (on travis-ci), R 3.4.2

R CMD check results
-------------------

There were no ERRORs or WARNINGs.

There was 1 NOTE:

-   File 'MODA/libs/x64/MODA.dll': Found no calls to: 'R\_registerRoutines', 'R\_useDynamicSymbols'

Users reported that this is a false positive when using devtools::check() in Rstudio.

Downstream dependencies
-----------------------

I have also run R CMD check on downstream dependencies of MODA. No ERRORs or WARNINGs found.
