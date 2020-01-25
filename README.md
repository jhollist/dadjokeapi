# jokeR

Forked from [Jeff Hollister's dadjoke R package](https://github.com/jhollist/dadjoke), this fork removes the sting and adds a similar function for Chuck Norris jokes. I'm planning to use this package in R/Shiny apps as "loading screen entertainment" and the sting starts to wear after a while!

## Credits:

Jeff Hollister (for the original R package!), [Brett Langdon](https://brett.is/) (for the <https://icanhazdadjoke.com> API), and whoever (?) is the mastermind behind the [Internet Chuck Norris Database](https://icndb.com). 


## Installation

You can install jokeR from GitHub with:

``` r
# install.packages("devtools")
devtools::install_github("tanho63/joker")
```

## Example

This is a basic example which shows you how to solve a common problem...  the problem of not laughing enough!!!

``` r
joker::groan()

[1] "I was thinking about moving to Moscow but there is no point Russian into things."
```
