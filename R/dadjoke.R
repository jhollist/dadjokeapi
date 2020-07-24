#' Function to return random dad joke
#'
#' This function returns a random dad joke from \url{https://icanhazdadjoke.com}
#' @export
#' @examples
#' dadjoke()


dadjoke <- function(){
  if(curl::has_internet()){
    request<-httr::GET("https://icanhazdadjoke.com",
                       httr::user_agent("joker R package (https://github.com/tanho63/joker)"),
                       httr::accept("text/plain"))
    joke <- httr::content(request, "text", encoding = "UTF-8")
  } else {
    joke <- "Why did the chicken cross the road? Because you don't currently have an internet connection."
  }
  return(joke)
}
