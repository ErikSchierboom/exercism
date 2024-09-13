anagram <- function(subject, candidates) {
  sorted <- \(str) str |> tolower() |> strsplit("") |> unlist() |> sort()
  
  is_anagram <- \(candidate) {
    !identical(tolower(subject), tolower(candidate)) &&
      identical(sorted(subject), sorted(candidate))
  }

  anagrams <- candidates[sapply(candidates, is_anagram)]
  if (length(anagrams) == 0)return(c())
  
  anagrams
}


