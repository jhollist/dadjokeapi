#' Function to return random Chuck Norris joke
#'
#' This function returns a random Chuck Norris joke from \url{https://chucknorris.io}
#'
#' @param sfw (Defaults to TRUE) Filters out explicit, political, and religion jokes from the potential returns.
#' @return A random Chuck Norris joke from \url{https://chucknorris.io}
#' @export
#' @examples
#' chuckjoke()
#' chuckjoke(sfw=FALSE)


chuckjoke <- function(sfw = TRUE) {
  if (curl::has_internet()) {
    if (sfw == TRUE) {
      jokerequest <-
        httr::GET(
          "https://api.chucknorris.io/jokes/random?category=animal,career,celebrity,dev,fashion,food,history,money,movie,music,science,sport,travel",
          httr::user_agent("joker R package (https://github.com/tanho63/joker)"),
          httr::accept("application/json")
        )
    } else {
      jokerequest <-
        httr::GET(
          "https://api.chucknorris.io/jokes/random",
          httr::user_agent("joker R package (https://github.com/tanho63/joker)"),
          httr::accept("application/json")
        )
    }
    joke <- httr::content(jokerequest, "text", encoding = "UTF-8")
    joke <- jsonlite::fromJSON(joke)$value
  } else {
    joke <-
      "Chuck Norris roundhouse-kicked your internet connection, and that's why it's down right now."
  }
  return(joke)
}
