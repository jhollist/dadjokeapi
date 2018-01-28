#' Function to return random dad joke
#'
#' This function returns a random dad joke from \url{https://icanhazdadjoke.com}
#' @param rimshot Plays a rimshot after the joke.  Sound from
#'                \url{https://archive.org/details/Rimshot_254}
#' @export
#' @examples
#' groan()


groan <- function(rimshot = TRUE){
  request<-httr::GET("https://icanhazdadjoke.com",
                     httr::accept("text/plain"))
  joke <- httr::content(request, "text", encoding = "UTF-8")
  if(rimshot){
    message(joke)
    Sys.sleep(0.5)
    beepr::beep(system.file("sounds/joke_sting.wav",package = "dadjoke"))
  } else {
    message(joke)
  }
  invisible(joke)
}
