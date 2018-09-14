module School where

import Data.Function (on)
import Data.Ord (comparing)
import Data.List (sortBy, nubBy, sort)
import Data.Maybe (fromMaybe)

type School = [(Int, [String])]

empty :: School
empty = []

add :: Int -> String -> School -> School
add g name school = nubBy ((==) `on` fst) updatedSchool where
    updatedSchool = (g, updatedNames) : school
    updatedNames = sort $ name : grade g school

sorted :: School -> School
sorted school = sortBy (comparing fst) school

grade :: Int -> School -> [String]
grade g school = fromMaybe [] $ lookup g school