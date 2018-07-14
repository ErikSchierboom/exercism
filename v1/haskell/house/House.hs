module House (rhyme) where

import qualified Data.Vector as V

rhyme :: String
rhyme = unlines $ map block [1..numberOfBlocks]

block :: Int -> String
block number = unlines $ map lineForBlock [number, number - 1..1] where
    lineForBlock = line number

line :: Int -> Int -> String
line number index
    | index == number = "This is the " ++ subject ++ end
    | otherwise = "that " ++ verb ++ " the " ++ subject ++ end where
        (subject, verb) = subjects V.! (index - 1)
        end = case index of
                1 -> "."
                _ -> ""

subjects :: V.Vector (String, String) 
subjects = V.fromList [("house that Jack built", "lay in"),
                       ("malt", "ate"),
                       ("rat", "killed"),
                       ("cat", "worried"),
                       ("dog", "tossed"),
                       ("cow with the crumpled horn", "milked"),
                       ("maiden all forlorn", "kissed"),
                       ("man all tattered and torn", "married"),
                       ("priest all shaven and shorn", "woke"),
                       ("rooster that crowed in the morn", "kept"),
                       ("farmer sowing his corn", "belonged to"),
                       ("horse and the hound and the horn", "")]

numberOfBlocks :: Int
numberOfBlocks = V.length subjects