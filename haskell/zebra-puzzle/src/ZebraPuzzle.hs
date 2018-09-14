module ZebraPuzzle (Resident(..), Solution(..), solve) where

import Data.List (permutations, elemIndex)
import Data.Maybe (fromJust)

data Resident = Englishman | Spaniard | Ukrainian | Norwegian | Japanese
  deriving (Eq, Show, Enum)

data Color = Red | Green | Ivory | Yellow | Blue
  deriving (Eq, Show, Enum)

data Pet = Dog | Snails | Fox | Horse | Zebra
  deriving (Eq, Show, Enum)

data Drink = Coffee | Tea | Milk | OrangeJuice | Water
  deriving (Eq, Show, Enum)

data Smoke = OldGold | Kools | Chesterfields | LuckyStrike | Parliaments  
  deriving (Eq, Show, Enum)

data Solution = Solution { waterDrinker :: Resident
                         , zebraOwner :: Resident
                         } deriving (Eq, Show)

residents = [Englishman ..]
colors = [Red ..]
pets = [Dog ..]
drinks = [Coffee ..]
smokes = [OldGold ..]

solve :: Solution
solve = Solution (validResidents !! index Water validDrinks) (validResidents !! index Zebra validPets)
  where (_, validResidents, validPets, validDrinks, _) = head solutions

solutions :: [([Color], [Resident], [Pet], [Drink], [Smoke])]
solutions = [
    (validColors, validResidents, validPets, validDrinks, validSmokes)
    | validColors    <- filter matchesColorRules $ permutations colors,
      validResidents <- filter (matchesNationalityRules validColors) $ permutations residents,
      validPets      <- filter (matchesPetRules validResidents) $ permutations pets,
      validDrinks    <- filter (matchesDrinkRules validColors validResidents) $ permutations drinks,
      validSmokes    <- filter (matchesSmokeRules validColors validResidents validDrinks validPets) $ permutations smokes      
  ]

index :: Eq a => a -> [a] -> Int
index x xs = fromJust $ elemIndex x xs  

(==>) :: Eq a => Eq b => ([a], a) -> ([b], b) -> Bool
(==>) (values1, value1) (values2, value2) =
  values2 !! index value1 values1 == value2

(<==>) :: Eq a => Eq b => ([a], a) -> ([b], b) -> Bool
(<==>) (values1, value1) (values2, value2) =
  leftMatch || rightMatch
  where
    index' = index value1 values1
    leftMatch = index' > 0 && values2 !! (index' - 1) == value2
    rightMatch = index' < 4 && values2 !! (index' + 1) == value2

matchesColorRules :: [Color] -> Bool
matchesColorRules colors = 
  greenRightOfIvoryHouse where
    greenRightOfIvoryHouse = index Ivory colors == index Green colors - 1 -- #6

matchesNationalityRules :: [Color] -> [Resident] -> Bool
matchesNationalityRules colors residents = 
    englishManInRedHouse && norwegianInFirstHouse && norwegianLivesNextToBlueHouse where
      englishManInRedHouse = (residents, Englishman) ==> (colors, Red) -- #2
      norwegianInFirstHouse = head residents == Norwegian -- #10
      norwegianLivesNextToBlueHouse = (residents, Norwegian) <==> (colors, Blue) -- #15

matchesPetRules :: [Resident] -> [Pet] -> Bool
matchesPetRules residents pets  = 
  spaniardOwnsDog where
    spaniardOwnsDog = (residents, Spaniard) ==> (pets, Dog) -- #3
    
matchesDrinkRules :: [Color] -> [Resident] -> [Drink] -> Bool
matchesDrinkRules colors residents drinks  = 
  coffeeDrunkInGreenHouse && ukranianDrinksTee && milkDrunkInMiddleHouse where
    coffeeDrunkInGreenHouse = (colors, Green) ==> (drinks, Coffee) -- #4
    ukranianDrinksTee = (residents, Ukrainian) ==>  (drinks, Tea) -- #5
    milkDrunkInMiddleHouse = drinks !! 2  == Milk -- #9

matchesSmokeRules :: [Color] -> [Resident] -> [Drink] -> [Pet] -> [Smoke] -> Bool
matchesSmokeRules colors residents drinks pets smokes = 
  oldGoldSmokesOwnsSnails && koolsSmokedInYellowHouse && chesterfieldsSmokedNextToHouseWithFox &&
  koolsSmokedNextToHouseWithHorse && luckyStrikeSmokerDrinksOrangeJuice && japaneseSmokesParliaments where
    oldGoldSmokesOwnsSnails = (smokes, OldGold) ==> (pets, Snails) -- #7
    koolsSmokedInYellowHouse = (colors, Yellow) ==> (smokes, Kools) -- #8
    chesterfieldsSmokedNextToHouseWithFox = (smokes, Chesterfields) <==> (pets, Fox) -- #11
    koolsSmokedNextToHouseWithHorse = (smokes, Kools) <==> (pets, Horse) -- #12
    luckyStrikeSmokerDrinksOrangeJuice = (smokes, LuckyStrike) ==> (drinks, OrangeJuice) -- #13
    japaneseSmokesParliaments = (residents, Japanese) ==> (smokes, Parliaments) -- #14