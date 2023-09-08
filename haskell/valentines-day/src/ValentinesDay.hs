module ValentinesDay where

data Approval
    = Yes
    | No
    | Maybe

data Cuisine
    = Korean
    | Turkish

data Genre
    = Crime
    | Horror
    | Romance
    | Thriller

data Activity
    = BoardGame
    | Chill
    | Movie Genre
    | Restaurant Cuisine
    | Walk Int

rateActivity :: Activity -> Approval
rateActivity (Movie Romance) = Yes
rateActivity (Restaurant Korean) = Yes
rateActivity (Restaurant Turkish) = Maybe
rateActivity (Walk distance) 
    | distance < 3 = Yes
    | distance <= 5 = Maybe
    | otherwise = No
rateActivity _ = No
