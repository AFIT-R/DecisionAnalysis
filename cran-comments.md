<!-- cran-comments.md is generated from cran-comments.Rmd. Please edit that file -->
Test environments
-----------------

-   local win install, R 3.4.3
-   ubuntu 14.04.5 (on travis-ci), R 3.4.2
-   Ubuntu Linux 16.04 LTS, R-release, GCC (on rhub)
-   Windows Server 2008 R2 SP1, R-devel, 32/64 bi (on rhub)

R CMD check results
-------------------

There were no ERRORs or WARNINGs.

There were 2 NOTEs:

-   File 'DecisionAnalysis/libs/x64/DecisionAnalysis.dll': Found no calls to: 'R\_registerRoutines', 'R\_useDynamicSymbols'

Users reported that this is a false positive when using devtools::check() in Rstudio.

-   Possibly mis-spelled words in DESCRIPTION: MAVF (25:15, 26:73, 27:45) SAVF (22:62, 23:84) SAVFs (26:29)

These are acronyms and are defined in the description.

Downstream dependencies
-----------------------

There are currently no downstream dependencies of DecisionAnalysis.
