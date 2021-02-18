[![R build
status](https://github.com/jhollist/dadjoke/workflows/R-CMD-check/badge.svg)](https://github.com/jhollist/dadjoke/actions)
[![](https://www.r-pkg.org/badges/version/dadjoke)](https://www.r-pkg.org/pkg/dadjoke)
[![CRAN RStudio mirror
downloads](https://cranlogs.r-pkg.org/badges/dadjoke)](https://www.r-pkg.org/pkg/dadjoke)
[![Codecov test
coverage](https://codecov.io/gh/jhollist/dadjoke/branch/master/graph/badge.svg)](https://codecov.io/gh/jhollist/dadjoke?branch=master)

# dadjoke

The goal of dadjoke is to make you laugh in spite of yourself.

It is built off of the hard work of [Brett Langdon](https://brett.is/) and the API he supports at <https://icanhazdadjoke.com>

## Installation

You can install dadjoke from github with:

``` r
# install.packages("devtools")
devtools::install_github("jhollist/dadjoke")
```

And from CRAN with

``` r
install.packages("dadjoke")
```

## Example

This is a basic example which shows you how to solve a common problem...  The problem of not laughing enough!!!

``` r
dadjoke::groan()

[1] "I was thinking about moving to Moscow but there is no point Russian into things."
```
