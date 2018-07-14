module Anagram

open System

let lower (str: string) = str.ToLower()

let normalize str = 
    str 
    |> lower 
    |> Seq.sort 
    |> Seq.toList
    
let isAnagram target =
    let normalizedTarget = normalize target    
    fun source -> lower source <> lower target && normalize source = normalizedTarget
       
let anagrams sources target = List.filter (isAnagram target) sources