#' Function to return random dad joke
#'
#' This function returns a random dad joke from \url{https://icanhazdadjoke.com}
#' @export
#' @examples
#' groan()


groan <- function(){
  request<-httr::GET("https://icanhazdadjoke.com",
                     httr::accept("text/plain"))
  httr::content(request, encoding = "ISO-8859-1")
}
