#' Function to return random joke from package functions
#'
#' This function chooses a joke to return, calling either dadjoke() or chuckjoke() at random.
#' @export
#' @examples 
#' randomjoke()


randomjoke <- function(){
  randomjokeselector<-sample(1:10,1)

  if (randomjokeselector > 5){
    dadjoke()
    } else{
    chuckjoke()
  }
}
