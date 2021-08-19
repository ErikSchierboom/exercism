module GradeSchool

let empty = Map.empty<int, string list>

let grade number school =  Map.tryFind number school |> Option.defaultValue []

let add student number school = Map.add number (List.sort (student :: grade number school)) school

let roster school = Map.toList school
