module GradeSchool exposing (..)

import Dict exposing (Dict, empty, get, foldr, insert, foldr)
import Maybe exposing (withDefault)
import List exposing (sort)


type alias Student =
    String


type alias Students =
    List Student


type alias Grade =
    Int


type alias School =
    Dict Grade Students


empty : School
empty =
    Dict.empty


addStudent : Grade -> Student -> School -> School
addStudent grade name school =
    case (get grade school) of
        Just names ->
            insert grade (name :: names |> sort) school

        Nothing ->
            insert grade [ name ] school


studentsInGrade : Grade -> School -> Students
studentsInGrade grade school =
    get grade school |> withDefault []


allStudents : School -> List ( Grade, Students )
allStudents school =
    foldr (\grade students acc -> ( grade, students ) :: acc) [] school
