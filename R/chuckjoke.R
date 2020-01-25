#' Function to return random Chuck Norris joke
#'
#' This function returns a random Chuck Norris joke from \url{https://icndb.com}
#' 
#' @export
#' @examples
#' chuckjoke()


chuckjoke <- function(explicit = FALSE) {
  if (curl::has_internet()) {
    if (explicit == FALSE) {
      request <-
        httr::GET(
          "http://api.icndb.com/jokes/random?exclude=[explicit]",
          httr::user_agent("joker R package (https://github.com/tanho63/joker)"),
          httr::accept("application/json")
        )
    } else {
      request <-
        httr::GET(
          "http://api.icndb.com/jokes/random",
          httr::user_agent("joker R package (https://github.com/tanho63/joker)"),
          httr::accept("application/json")
        )
    }
    joke <- httr::content(request, "text", encoding = "UTF-8")
    joke <- jsonlite::fromJSON(joke)$value$joke
    joke <- textutils::HTMLdecode(joke)
  } else {
    joke <-
      "Chuck Norris roundhouse-kicked your internet connection, and that's why it's down right now."
  }
  message(joke)
  
  invisible(joke)
}
