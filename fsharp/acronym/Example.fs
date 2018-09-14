module Acronym
    
open System
open System.Text.RegularExpressions

let acronym (phrase: string) =      
    let words = Regex.Matches(phrase, "[A-Z]+[a-z]*|[a-z]+")
    let acronymChar = string << Char.ToUpperInvariant << Seq.head
    let acronymChars = [for word in words do yield acronymChar word.Value]
    String.concat "" acronymChars