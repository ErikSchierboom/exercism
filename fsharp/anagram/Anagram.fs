module Anagram

open System

let private sortedLowerCase (str: string) =  str.ToLower() |> Seq.sort |> Seq.toArray |> String
    
let isAnagram word candidate =
    sortedLowerCase candidate = sortedLowerCase word &&
    candidate.ToLower() <> word.ToLower()
       
let anagrams candidates word = List.filter (isAnagram word) candidates
