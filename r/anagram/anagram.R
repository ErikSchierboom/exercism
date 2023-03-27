anagram <- function(subject, candidates) {
  str.sort <- \(str) sort(strsplit(tolower(str), "")[[1]])
  
  is_anagram <- \(candidate)
    !identical(tolower(subject), tolower(candidate)) &&
      identical(str.sort(subject), str.sort(candidate))

  anagrams <- candidates[sapply(candidates, is_anagram)]
  if (length(anagrams) == 0) {
    return(c())
  } 
  
  anagrams
}


