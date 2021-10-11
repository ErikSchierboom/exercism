module TracksOnTracksOnTracks

let newList: string list = []

let existingList = ["F#"; "Clojure"; "Haskell"]

let addLanguage language languages = language :: languages

let countLanguages languages = List.length languages

let reverseList languages = List.rev languages

let excitingList (languages: string list) = 
    match languages with
    | "F#" :: _ | [_; "F#"] | [_; "F#"; _] -> true
    | _ -> false
