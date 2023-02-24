module Anagram
       
let findAnagrams candidates word =
    let isAnagram (word: string) (candidate: string) =
        let sortedCharacters (str: string) =  str.ToLower() |> Seq.sort |> Seq.toArray |> System.String        
        sortedCharacters word = sortedCharacters word && candidate.ToLower() <> word.ToLower()
    
    List.filter (isAnagram word) candidates
