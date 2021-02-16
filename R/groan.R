#' Function to return random dad joke
#'
#' This function returns a random dad joke(s) from 
#' \url{https://icanhazdadjoke.com}. as a message and invisibly as a character.
#' 
#' @param sting Plays a joke sting after the joke.  Sound from
#'                \url{https://archive.org/details/Rimshot_254}
#' @export
#' @return Invisibly returns a two item list with the first item holding the
#'         joke as a character and the second item containing the joke id as a
#'         character.
#' @examples
#' groan()
groan <- function(sting = TRUE) {
  
  if (!curl::has_internet()) {
    stop("Why did the chicken cross the road? Because you don't currently have an internet connection.")
  }  
  request <- httr::GET("https://icanhazdadjoke.com",
                     httr::user_agent("dadjoke R package (https://github.com/jhollist/dadjoke)"),
                     httr::accept("application/json"))
  if (httr::http_type(request) != "application/json") {
    stop("The icanhazdadjoke API did not return JSON as expected", call. = FALSE)
  }
  joke <- httr::content(request, "parsed", encoding = "UTF-8")
  message(joke$joke)

  if (sting) {
    Sys.sleep(1/2)
    beepr::beep(system.file("sounds/joke_sting.wav",package = "dadjoke"))
  } 
  invisible(joke[c("joke", "id")])
}

#' Function to return a specific dad joke 
#'
#' This function returns a specific dad joke from 
#' \url{https://icanhazdadjoke.com} using its dad joke ID. 
#'  
#' @param joke_id A specific dad joke ID to return
#' @return Returns a two item list with the first item holding the joke as a 
#'         character and the second item containing the joke id as a character.                  
#' @export
#' @examples
#' groan_id("GlGBIY0wAAd")
groan_id <- function(joke_id) {
  
  if (!curl::has_internet()) {
    stop("Why did the chicken cross the road? Because you don't currently have an internet connection.")
  }  
  
  url <- paste0("https://icanhazdadjoke.com/j/", joke_id)
  request <- httr::GET(url,
                       httr::user_agent("dadjoke R package (https://github.com/jhollist/dadjoke)"),
                       httr::accept("application/json"))
  if (httr::http_type(request) != "application/json") {
    stop("The icanhazdadjoke API did not return JSON as expected", call. = FALSE)
  }
  joke <- httr::content(request, "parsed", encoding = "UTF-8")

  joke[c("joke", "id")]
}

#' Function to return a specific dad joke as an image 
#'
#' This function returns a specific dad joke as a png from 
#' \url{https://icanhazdadjoke.com} using its dad joke ID. 
#'  
#' @param joke_id A specific dad joke ID to return
#' @return Returns a png array from png::readPNG.     
#' @export
#' @examples
#' joke_png <- groan_image("GlGBIY0wAAd")
groan_image <- function(joke_id) {
  
  if (!curl::has_internet()) {
    stop("Why did the chicken cross the road? Because you don't currently have an internet connection.")
  }  
  
  url <- paste0("https://icanhazdadjoke.com/j/", joke_id, ".png")
  request <- httr::GET(url,
                       httr::user_agent("dadjoke R package (https://github.com/jhollist/dadjoke)"),
                       httr::accept("image/png"))
  if (httr::http_type(request) != "image/png") {
    stop("The icanhazdadjoke API did not return a PNG as expected", call. = FALSE)
  }
  joke <- readPNG(request$content)
  joke
}

#' Function to search and return dad jokes with specific terms 
#'
#' This function returns a specific dad joke as a png from 
#' \url{https://icanhazdadjoke.com} using its dad joke ID. 
#'  
#' @param term A term to search \url{https://icanhazdadjoke.com} 
#' @return Returns a tibble of joke and joke id for jokes that contain the 
#'         search term.             
#' @export
#' @importFrom dplyr bind_rows
#' @examples
#' groan_search(term = "cat")
groan_search <- function(term) {
  
  if (!curl::has_internet()) {
    stop("Why did the chicken cross the road? Because you don't currently have an internet connection.")
  }  
  
  url <- paste0("https://icanhazdadjoke.com/search?term=", term, "&page=1&limit=30")
  request <- httr::GET(url,
                       httr::user_agent("dadjoke R package (https://github.com/jhollist/dadjoke)"),
                       httr::accept("application/json"))
  if (httr::http_type(request) != "application/json") {
    stop("The icanhazdadjoke API did not return JSON as expected", call. = FALSE)
  }
  jokes <- httr::content(request, "parsed", encoding = "UTF-8")
  n_page <- jokes$total_pages
  results <- jokes$results
  if (n_page > 1 & n_page <= 50) {
    for (page in seq(2, n_page)) {
      url <- paste0("https://icanhazdadjoke.com/search?term=", term, "&page=", page, "&limit=30")
      request <- httr::GET(url,
                           httr::user_agent("dadjoke R package (https://github.com/jhollist/dadjoke)"),
                           httr::accept("application/json"))
      if (httr::http_type(request) != "application/json") {
        stop("The icanhazdadjoke API did not return JSON as expected", call. = FALSE)
      }
      jokes <- httr::content(request, "parsed", encoding = "UTF-8")
      results <- c(results, jokes$results)
    }
  } else if (n_page > 50) {
    stop(paste("You request will result in", n_page, "hits to the 
         icanhazdadjoke API and the current limit is 50. Try narrowing your 
         search or use the page argument to specify individual pages."))
  }
  
  jokes <-dplyr::bind_rows(results)
  jokes <- jokes[c("joke", "id")]
  jokes
}