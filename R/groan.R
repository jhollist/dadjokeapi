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
#' @param image A logical to indicate if an image of a specific joke ID should 
#'              be returned instead of text.
#' @param sting Plays a joke sting after the joke.  Sound from
#'                \url{https://archive.org/details/Rimshot_254}
#' @return Returns a two item list with the first item holding the joke as a 
#'         character and the second item containing the joke id as a character.                  
#' @export
#' @examples
#' groan_id("GlGBIY0wAAd")


groan_id <- function(joke_id, sting = TRUE) {
  
  if (!curl::has_internet()) {
    stop("Why did the chicken cross the road? Because you don't currently have an internet connection.")
  }  
  
  url <- paste0("https://icanhazdadjoke.com/j/", joke_id)
  request <- httr::GET(url,
                       httr::user_agent("dadjoke R package (https://github.com/jhollist/dadjoke)"),
                       httr::accept("application/json"))

  joke <- httr::content(request, "parsed", encoding = "UTF-8")

  if (sting) {
    Sys.sleep(1/2)
    beepr::beep(system.file("sounds/joke_sting.wav",package = "dadjoke"))
  } 
  joke[c("joke", "id")]
}

#' Function to return a specific dad joke as an image 
#'
#' This function returns a specific dad joke as a png from 
#' \url{https://icanhazdadjoke.com} using its dad joke ID. 
#'  
#' @param joke_id A specific dad joke ID to return
#' @param image A logical to indicate if an image of a specific joke ID should 
#'              be returned instead of text.
#' @param sting Plays a joke sting after the joke.  Sound from
#'                \url{https://archive.org/details/Rimshot_254}
#' @return Returns a png array from png::readPNG.                  
#' @export
#' @examples
#' joke_png <- groan_image("GlGBIY0wAAd")
groan_image <- function(joke_id, sting = TRUE) {
  
  if (!curl::has_internet()) {
    stop("Why did the chicken cross the road? Because you don't currently have an internet connection.")
  }  
  
  url <- paste0("https://icanhazdadjoke.com/j/", joke_id, ".png")
  request <- httr::GET(url,
                       httr::user_agent("dadjoke R package (https://github.com/jhollist/dadjoke)"),
                       httr::accept("image/png"))
  joke <- png::readPNG(request$content)
  joke
}

#' Function to search and return dad jokes with specific terms 
#'
#' This function returns a specific dad joke as a png from 
#' \url{https://icanhazdadjoke.com} using its dad joke ID. 
#'  
#' @param term A term to search \url{https://icanhazdadjoke.com} 
#' @param sting Plays a joke sting after the joke.  Sound from
#'                \url{https://archive.org/details/Rimshot_254}
#' @return Returns a data frame of joke and joke id for jokes that contain the 
#'         search term.             
#' @export
#' @examples
#' groan()
groan_search <- function(term, page = NULL, sting = TRUE) {
  
  if (!curl::has_internet()) {
    stop("Why did the chicken cross the road? Because you don't currently have an internet connection.")
  }  
  url <- paste0("https://icanhazdadjoke.com/search?term=", term, "&page=1")
  request <- httr::GET(url,
                       httr::user_agent("dadjoke R package (https://github.com/jhollist/dadjoke)"),
                       httr::accept("application/json"))
  jokes <- httr::content(request, "parsed", encoding = "UTF-8")
  n_page <- jokes$total_pages
  results <- jokes$results
  if (is.null(page) & n_page > 1 & n_page < 20) {
    for (page in seq(2, n_page)) {
      url <- paste0("https://icanhazdadjoke.com/search?term=", term, "&page=", page)
      request <- httr::GET(url,
                           httr::user_agent("dadjoke R package (https://github.com/jhollist/dadjoke)"),
                           httr::accept("application/json"))
      jokes <- httr::content(request, "parsed", encoding = "UTF-8")
      results <- c(results, jokes$results)
    }
  } else if (!is.null(page) & page != 1) {
    url <- paste0("https://icanhazdadjoke.com/search?term=", term, "&page=", page)
    request <- httr::GET(url,
                         httr::user_agent("dadjoke R package (https://github.com/jhollist/dadjoke)"),
                         httr::accept("application/json"))
    jokes <- httr::content(request, "parsed", encoding = "UTF-8")
    n_page <- jokes$total_pages
    results <- jokes$results
  } else {
    stop("You request will result in a large number of ")
  }
  jokes <- data.frame(t(sapply(results, c)))
  names(jokes) <- c("id", "joke")
  jokes <- jokes[c("joke", "id")]
  jokes
}