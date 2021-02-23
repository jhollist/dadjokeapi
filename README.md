[![R build
status](https://github.com/jhollist/dadjokeapi/workflows/R-CMD-check/badge.svg)](https://github.com/jhollist/dadjokeapi/actions)
[![Codecov test
coverage](https://codecov.io/gh/jhollist/dadjokeapi/branch/master/graph/badge.svg)](https://codecov.io/gh/jhollist/dadjokeapi?branch=master)

# dadjokeapi

The goal of dadjokeapi is to make you laugh in spite of yourself.

It is built off of the hard work of [Brett Langdon](https://brett.is/) and the API he supports at <https://icanhazdadjoke.com>

## Installation

You can install dadjokeapi from github with:

``` r
# install.packages("devtools")
devtools::install_github("jhollist/dadjokeapi")
```

And from CRAN with

``` r
install.packages("dadjokeapi")
```

## Example

This is a basic example which shows you how to solve a common problem...  The problem of not laughing enough!!!

``` r
dadjokeapi::groan()

[1] "I was thinking about moving to Moscow but there is no point Russian into things."
```
