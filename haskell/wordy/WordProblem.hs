{-# LANGUAGE OverloadedStrings #-}

module WordProblem (answer) where

import Control.Applicative ((<|>))
import Data.Attoparsec.Text
import Data.Text (pack)

answer :: String -> Maybe Int
answer = maybeResult . parse questionParser . pack

operatorParser :: Parser (Int -> Int -> Int)
operatorParser = 
    (string "plus"          >> return (+)) <|>
    (string "minus"         >> return (-)) <|>
    (string "multiplied by" >> return (*)) <|>
    (string "divided by"    >> return div)

operationParser :: Parser (Int -> Int)
operationParser = do
    _        <- space
    operator <- operatorParser
    _        <- space
    right    <- numberParser
    return (flip operator right)

questionParser :: Parser Int
questionParser = do
    _          <- string "What is "
    left       <- numberParser
    operations <- many' operationParser
    return (foldl (\acc op -> op acc) left operations)

numberParser :: Parser Int 
numberParser = signed decimal