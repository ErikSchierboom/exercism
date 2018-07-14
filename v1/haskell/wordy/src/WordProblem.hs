{-# LANGUAGE OverloadedStrings #-}

module WordProblem (answer) where

import Control.Applicative ((<|>), (<$>))
import Data.Attoparsec.Text (Parser, parse, maybeResult, space, decimal, signed, string, sepBy1)
import Data.Text (pack)

data Expression 
    = Operand Int 
    | Plus Expression Expression 
    | Minus Expression Expression 
    | DividedBy Expression Expression 
    | MultipliedBy Expression Expression
    deriving (Show)

buildExpression :: Expression -> [(Expression -> Expression -> Expression, Expression)] -> Expression 
buildExpression = foldl (\acc (operator, right) -> operator acc right)

operandParser :: Parser Expression 
operandParser = Operand <$> signed decimal

operatorParser :: Parser (Expression -> Expression -> Expression)
operatorParser = 
    (string "plus"          >> return Plus)         <|>
    (string "minus"         >> return Minus)        <|>
    (string "divided by"    >> return DividedBy)    <|>
    (string "multiplied by" >> return MultipliedBy)

operationParser :: Parser Expression
operationParser = do
    left       <- (operandParser <|> operationParser) <* space
    operations <- sepBy1 (do
        operator  <- operatorParser <* space 
        operation <- operandParser <|> operationParser
        return (operator, operation)) space
    return (buildExpression left operations)

equationParser :: Parser Expression
equationParser = string "What is " *> operationParser <* string "?"

solveExpression :: Expression -> Int
solveExpression (Operand x) = x
solveExpression (Plus         left right) = solveExpression left + solveExpression right
solveExpression (Minus        left right) = solveExpression left - solveExpression right
solveExpression (DividedBy    left right) = solveExpression left `div` solveExpression right
solveExpression (MultipliedBy left right) = solveExpression left * solveExpression right

answer :: String -> Maybe Int
answer = fmap solveExpression . maybeResult . parse equationParser . pack