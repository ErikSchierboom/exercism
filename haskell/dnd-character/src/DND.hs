module DND ( Character(..)
           , ability
           , modifier
           , character
           ) where

import Test.QuickCheck (Gen, choose, vectorOf, elements)

data Character = Character
  { name         :: String
  , strength     :: Int
  , dexterity    :: Int
  , constitution :: Int
  , intelligence :: Int
  , wisdom       :: Int
  , charisma     :: Int
  , hitpoints    :: Int
  }
  deriving (Show, Eq)

modifier :: Int -> Int
modifier score = (score - 10) `div` 2

die :: Gen Int
die = choose (1, 6)

ability :: Gen Int
ability = do
  dice <- vectorOf 3 die
  return $ sum dice

firstName :: Gen String
firstName = elements ["John", "Gregor", "Robert", "Tywin", "Ramsay", "Cersei", "Stannis", "Samwell"]

lastName :: Gen String
lastName = elements ["Stark", "Lannister", "Baratheon", "Clegane", "Bolton", "Mormont", "Snow", "Tarly"]

fullName :: Gen String
fullName = do
  firstName' <- firstName
  lastName' <- lastName
  return $ firstName' ++ " " ++ lastName'

character :: Gen Character
character = do
  name' <- fullName
  strength' <- ability
  dexterity' <- ability
  constitution' <- ability
  intelligence' <- ability
  wisdom' <- ability
  charisma' <- ability
  let hitpoints' = 10 + modifier constitution'
  return $ Character name' strength' dexterity' constitution' intelligence' wisdom' charisma' hitpoints'
