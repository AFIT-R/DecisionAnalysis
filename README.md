<!-- README.md is generated from README.Rmd. Please edit that file -->
[![Build Status](https://travis-ci.org/hadley/devtools.svg?branch=master)](https://travis-ci.org/whaleshark16/MODA) [![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/whaleshark16/MODA?branch=master&svg=true)](https://ci.appveyor.com/project/whaleshark16/MODA) [![Coverage Status](https://codecov.io/github/whaleshark16/MODA/coverage.svg?branch=master)](https://codecov.io/github/whaleshark16/MODA?branch=master) [![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/MODA)](https://cran.r-project.org/package=MODA)

MODA
----

Multi-Objective Decision Analysis (MODA) is a process for making decisions when there are very complex issues involving multiple criteria and multiple parties who may be deeply affected by the outcomes of the decisions.

Using MODA allows individuals to consider and weight factors and trade-offs while evaluating each alternative. The individuals are then able to discuss the results and trade offs to help decide on a recommendation.

The MODA package contains all of the necessary functions required to :

1.  Plot a value hierarchy tree with weights
2.  Calculate and plot linear, exponential, and categorical single attribute value functions
3.  Calculate multiple attribute value function scores and plot their breakout
4.  Conduct sensitivity analysis

Installation
------------

The `MODA` package is currently in development and only available from GitHub, but can easily be installed using the [devtools](https://cran.r-project.org/web/packages/devtools/index.html) package:

    if (!requireNamespace("devtools")) install.packages("devtools")
    devtools::install_github("AFIT-R/MODA")
