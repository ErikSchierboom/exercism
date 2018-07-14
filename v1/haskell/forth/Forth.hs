{-# LANGUAGE OverloadedStrings #-}
module Forth
  ( ForthError(..)
  , ForthState
  , evalText
  , formatStack
  , empty
  ) where

import Data.Char (isSpace, isControl)
import Data.Text (Text)
import Data.Map (Map)

import qualified Data.Text as T
import qualified Data.Text.Read as R
import qualified Data.Map as M

type Value = Int
type Word = Text

data Item = V Value | W Word deriving (Eq, Show)
data Operation = Plus | Minus | Mult | Div | Dup | Drop | Swap | Over | User [Item] deriving (Eq, Show)

data ForthState = S {
    sStack :: [Value]
  , sInput :: [Item]
  , sMapping :: Map Word Operation
} deriving (Show)

data ForthError
     = DivisionByZero
     | StackUnderflow
     | InvalidWord
     | UnknownWord Text
     deriving (Show, Eq)

empty :: ForthState
empty = S [] [] defaultMapping

parse :: Text -> ForthState -> ForthState
parse text state = addItems state $ parseText text

parseText :: Text -> [Item]
parseText = map parseItem . (filter notEmpty . T.split isSeparator) where
  isSeparator c = isSpace c || isControl c
  notEmpty = not . T.null

parseItem :: Text -> Item
parseItem text = case R.decimal text of
  Right (value, _) -> V value
  _                -> W text

addItems :: ForthState -> [Item] -> ForthState
addItems state@(S _ input _)  items = state { sInput = items ++ input }

evalText :: Text -> ForthState -> Either ForthError ForthState
evalText text state = eval $ Right $ parse text state

eval :: Either ForthError ForthState -> Either ForthError ForthState
eval (Left e) = Left e
eval (Right (S stack [] word)) = Right (S stack [] word)
eval (Right (S stack (V value:xs) mapping)) = eval $ Right (S (value:stack) xs mapping)
eval (Right (S stack (W word:xs) mapping)) = 
  case word of 
    ":" -> case break (\c -> c == W ";") xs of
      ((W userWord:operations), remainder) -> eval $ Right (S stack (tail remainder) (M.insert (T.toLower userWord) (User operations) mapping))
      _ -> Left InvalidWord      
    ";" -> Left InvalidWord
    _   -> eval $ evalWord word (S stack xs mapping)

evalWord :: Word -> ForthState -> Either ForthError ForthState
evalWord word state = 
  case M.lookup (T.toLower word) (sMapping state) of
    Nothing -> Left (UnknownWord word)
    Just op -> applyOp op state

applyOp :: Operation -> ForthState -> Either ForthError ForthState
applyOp Plus  state = binaryStackOp (toBinaryStackOp (+)) state
applyOp Minus state = binaryStackOp (toBinaryStackOp (-)) state
applyOp Mult  state = binaryStackOp (toBinaryStackOp (*)) state
applyOp Div   state = divOp state
applyOp Dup   state = unaryStackOp (replicate 2) state
applyOp Drop  state = unaryStackOp (\_ -> []) state
applyOp Swap  state = binaryStackOp (\x y -> [y,x]) state
applyOp Over  state = binaryStackOp (\x y -> [y,x,y]) state
applyOp (User terms) state = Right $ addItems state terms

toBinaryStackOp :: (Value -> Value -> Value) -> Value -> Value -> [Value]
toBinaryStackOp op x y = [op y x]

unaryStackOp :: (Value -> [Value]) -> ForthState -> Either ForthError ForthState
unaryStackOp op state@(S stack _ _) =
  case stack of 
    []   -> Left StackUnderflow
    x:xs -> Right $ state { sStack = op x ++ xs }

binaryStackOp :: (Value -> Value -> [Value]) -> ForthState -> Either ForthError ForthState
binaryStackOp op state@(S stack _ _) =
  case stack of 
    x:y:xs -> Right $ state { sStack = op x y ++ xs }
    _      -> Left StackUnderflow

divOp :: ForthState -> Either ForthError ForthState
divOp state@(S stack _ _) = 
  case stack of 
    0:_    -> Left DivisionByZero
    x:y:xs -> Right $ state { sStack = y `div` x:xs }
    _      -> Left StackUnderflow

formatStack :: ForthState -> Text
formatStack = T.pack . unwords . map show . reverse . sStack

defaultMapping :: Map Word Operation
defaultMapping = M.fromList [ ("+",    Plus)
                            , ("-",    Minus)
                            , ("*",    Mult)
                            , ("/",    Div)
                            , ("dup",  Dup)
                            , ("drop", Drop)
                            , ("swap", Swap)
                            , ("over", Over) ]