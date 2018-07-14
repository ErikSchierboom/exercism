module FoodChain (song) where

import qualified Data.Vector as V

song :: String
song = unlines $ map verse [0..verses -1]

verses :: Int
verses = 8

verse :: Int -> String
verse index = unlines $ (verseBegin index) ++ (verseEnd index)

verseBegin :: Int -> [String]
verseBegin 0 = ["I know an old lady who swallowed a fly."]
verseBegin 7 = ["I know an old lady who swallowed a horse."]
verseBegin index = ["I know an old lady who swallowed a " ++ subject ++ ".", followUp] where
    (subject, followUp) = subjects V.! (index - 1)

verseEnd :: Int -> [String]
verseEnd 7 = ["She's dead, of course!"]
verseEnd index = V.toList $ V.slice (V.length history - 1 - index) (index + 1) history

subjects :: V.Vector (String, String)
subjects = V.fromList [ ("spider", "It wriggled and jiggled and tickled inside her.")
                      , ("bird",   "How absurd to swallow a bird!")
                      , ("cat", "Imagine that, to swallow a cat!")
                      , ("dog", "What a hog, to swallow a dog!")
                      , ("goat", "Just opened her throat and swallowed a goat!")
                      , ("cow", "I don't know how she swallowed a cow!") ]

history :: V.Vector String
history = V.fromList [
    "I don't know how she swallowed a cow!"
  , "She swallowed the cow to catch the goat."
  , "She swallowed the goat to catch the dog."
  , "She swallowed the dog to catch the cat."
  , "She swallowed the cat to catch the bird."
  , "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her."
  , "She swallowed the spider to catch the fly."
  , "I don't know why she swallowed the fly. Perhaps she'll die." ]