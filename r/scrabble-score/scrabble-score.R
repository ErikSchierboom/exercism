scrabble_score <- function(input){
  letter_scores = c(1,3,3,2,1,4,2,4,1,8,5,1,3,1,1,3,10,1,1,1,1,4,4,8,4,10)
  names(letter_scores) = c('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')
  
  letters <- unlist(strsplit(toupper(input), split = ""))
  sum(letter_scores[letters])
}
