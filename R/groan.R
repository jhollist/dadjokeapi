#' Function to return random dad joke
#'
#' This function returns a random dad joke from \url{https://icanhazdadjoke.com}
#' @param sting Plays a joke sting after the joke.  Sound from
#'                \url{https://archive.org/details/Rimshot_254}
#' @export
#' @examples
#' groan()


groan <- function(sting = TRUE){
  if(curl::has_internet()){
    request<-httr::GET("https://icanhazdadjoke.com",
                       httr::accept("text/plain"))
    joke <- httr::content(request, "text", encoding = "UTF-8")
  } else {
    joke <- "Why did the chicken cross the road? Because you don't currently have an internet connection."
  }
  if(sting){
    message(joke)
    Sys.sleep(1)
    beepr::beep(system.file("sounds/joke_sting.wav",package = "dadjoke"))
  } else {
    message(joke)
  }
  invisible(joke)
}
