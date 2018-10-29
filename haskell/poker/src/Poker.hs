module Poker (bestHands) where

import Data.Maybe (mapMaybe, catMaybes, listToMaybe)
import Data.List (sort, sortOn, groupBy)

data Suit
    = Hearts
    | Diamonds
    | Clubs
    | Spades
    deriving (Show, Eq, Ord)

data Rank
    = Two
    | Three
    | Four
    | Five
    | Six
    | Seven
    | Eight
    | Nine
    | Ten
    | Jack 
    | Queen
    | King
    | Ace 
    deriving (Show, Eq, Ord)

data Card = Card { rank :: Rank
                 , suit :: Suit
                 } deriving (Show, Eq, Ord)

data Hand = Hand { card1 :: Card
                 , card2 :: Card
                 , card3 :: Card
                 , card4 :: Card
                 , card5 :: Card
                } deriving (Show, Eq, Ord)

data PokerHand 
    = HighCard      Rank Rank Rank Rank Rank
    | OnePair       Rank Rank Rank Rank 
    | TwoPair       Rank Rank Rank
    | ThreeOfAKind  Rank Rank Rank
    | Straight      Rank
    | Flush         Rank Rank Rank Rank Rank
    | FullHouse     Rank Rank
    | FourOfAKind   Rank Rank
    | StraightFlush Rank
    deriving (Show, Eq, Ord)

parseSuit :: Char -> Maybe Suit
parseSuit suit = case suit of
    'H' -> Just Hearts
    'D' -> Just Diamonds
    'C' -> Just Clubs
    'S' -> Just Spades
    _   -> Nothing

parseRank :: String -> Maybe Rank
parseRank rank = case rank of
    "2"  -> Just Two
    "3"  -> Just Three
    "4"  -> Just Four
    "5"  -> Just Five
    "6"  -> Just Six
    "7"  -> Just Seven
    "8"  -> Just Eight
    "9"  -> Just Nine
    "10" -> Just Ten
    "J"  -> Just Jack
    "Q"  -> Just Queen
    "K"  -> Just King
    "A"  -> Just Ace
    _    -> Nothing

parseCard :: String -> Maybe Card
parseCard [rank, suit] = Card <$> parseRank [rank] <*> parseSuit suit
parseCard [rank1, rank2, suit] = Card <$> parseRank [rank1, rank2] <*> parseSuit suit
parseCard _ = Nothing

parseHand :: String -> Maybe Hand
parseHand hand = case parsedCards of
    [c1, c2, c3, c4, c5] -> Just $ Hand c1 c2 c3 c4 c5
    _ -> Nothing
    where
        parsedCards = sort . mapMaybe parseCard $ words hand

cards :: Hand -> [Card]
cards (Hand c1 c2 c3 c4 c5) = [c1, c2, c3, c4, c5]

ranks :: Hand -> [Rank]
ranks hand = sort . map rank $ cards hand

suits :: Hand -> [Suit]
suits hand = sort . map suit $ cards hand

count :: Eq a => [a] -> [(a, Int)]
count xs = reverse . sortOn snd . map (\elements -> (head elements, length elements)) $ groupBy (==) xs

ranksWithCount :: Hand -> [(Rank, Int)]
ranksWithCount hand = count $ ranks hand

suitsWithCount :: Hand -> [(Suit, Int)]
suitsWithCount hand = count $ suits hand

nextRank :: Rank -> Rank
nextRank rank = case rank of 
    Two   -> Three
    Three -> Four
    Four  -> Five
    Five  -> Six
    Six   -> Seven
    Seven -> Eight
    Eight -> Nine
    Nine  -> Ten
    Ten   -> Jack
    Jack  -> Queen
    Queen -> King
    King  -> Ace
    Ace   -> Two

ranksAreSequential :: [Rank] -> Bool
ranksAreSequential (left:right:xs) = nextRank left == right && ranksAreSequential (right:xs)
ranksAreSequential _ = True

flush :: Hand -> Maybe PokerHand
flush hand = case (suitsWithCount hand, ranks hand) of
    ([(_, 5)], [r1, r2, r3, r4, r5]) -> Just $ Flush r1 r2 r3 r4 r5
    _ -> Nothing
    
straight :: Hand -> Maybe PokerHand
straight hand = case ranks hand of
    [Two, r2, r3, r4, Ace] -> if ranksAreSequential [Two, r2, r3, r4] then Just $ Straight r4 else Nothing
    [r1, r2, r3, r4, r5] -> if ranksAreSequential [r1, r2, r3, r4, r5] then Just $ Straight r5 else Nothing
    _ -> Nothing

straightFlush :: Hand -> Maybe PokerHand
straightFlush hand = case (flush hand, straight hand) of
    (Just _, Just _) -> Just . StraightFlush . head $ ranks hand
    _ -> Nothing
    
fourOfAKind :: Hand -> Maybe PokerHand
fourOfAKind hand = case ranksWithCount hand of
    [(rank1, 4), (rank2, 1)] -> Just $ FourOfAKind rank1 rank2
    _ -> Nothing
   
threeOfAKind :: Hand -> Maybe PokerHand
threeOfAKind hand = case ranksWithCount hand of
    [(rank1, 3), (rank2, 2)] -> Just $ ThreeOfAKind rank1 rank2 rank2
    [(rank1, 3), (rank2, 1), (rank3, 1)] -> Just $ ThreeOfAKind rank1 rank2 rank3
    _ -> Nothing

twoPair :: Hand -> Maybe PokerHand
twoPair hand = case ranksWithCount hand of
    [(rank1, 2), (rank2, 2), (rank3, 1)] -> Just $ TwoPair rank1 rank2 rank3
    _ -> Nothing

onePair :: Hand -> Maybe PokerHand
onePair hand = case ranksWithCount hand of
    [(rank1, 2), (rank2, 1), (rank3, 1), (rank4, 1)] -> Just $ OnePair rank1 rank2 rank3 rank4
    _ -> Nothing

fullHouse :: Hand -> Maybe PokerHand
fullHouse hand = case ranksWithCount hand of
    [(rank1, 3), (rank2, 2)] -> Just $ FullHouse rank1 rank2
    _ -> Nothing

highCard :: Hand -> Maybe PokerHand
highCard hand = case ranks hand of
    [r1, r2, r3, r4, r5] -> Just $ HighCard r1 r2 r3 r4 r5
    _ -> Nothing

pokerHandParsers :: [Hand -> Maybe PokerHand]
pokerHandParsers = [straightFlush, fourOfAKind, fullHouse, flush, straight, threeOfAKind, twoPair, onePair, highCard]

parsePokerHand :: String -> Maybe PokerHand
parsePokerHand input = case parseHand input of
    Just parsedHand -> listToMaybe $ mapMaybe (\handParser -> handParser parsedHand) pokerHandParsers
    Nothing -> Nothing

parsePokerHands :: [String] -> Maybe [(String, PokerHand)]
parsePokerHands hands = 
    if length pokerHands == length hands then
        Just $ zip hands pokerHands
    else
        Nothing
    where
        pokerHands = mapMaybe parsePokerHand hands

bestPokerHand :: [(String, PokerHand)] -> PokerHand
bestPokerHand pokerHands = maximum $ map snd pokerHands

bestHands :: [String] -> Maybe [String]
bestHands hands = case parsePokerHands hands of
    Nothing -> Nothing
    Just handsWithPokerHand -> 
        Just . map fst $ filter (\pokerHand -> bestPokerHand handsWithPokerHand == snd pokerHand) handsWithPokerHand