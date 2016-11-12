module Base (rebase) where

toBaseLoop :: Integral a => a -> a -> [a] -> [a]
toBaseLoop b 0 acc = acc 
toBaseLoop b n acc = toBaseLoop b n' (digit:acc)
    where 
        digit = n `mod` b
        n' = n `div` b

toBase :: Integral a => a -> a -> Maybe [a]
toBase b n =
    case toBaseLoop b n [] of 
        [] -> Just []
        digits -> Just digits

fromBaseLoop :: Integral a => a -> a -> [a] -> Maybe a
fromBaseLoop b acc [] = Just acc 
fromBaseLoop b acc digits
    | digit < 0 = Nothing
    | digit >= b = Nothing
    | otherwise = 
        fromBaseLoop b (acc * b + digit) rest where
            digit = head digits
            rest = tail digits

fromBase :: Integral a => a -> [a] -> Maybe a
fromBase b [] = Nothing
fromBase b nums = fromBaseLoop b 0 nums

rebase :: Integral a => a -> a -> [a] -> Maybe [a]
rebase inputBase outputBase inputDigits
    | inputBase < 2 = Nothing 
    | outputBase < 2 = Nothing
    | null inputDigits = Just []
    | otherwise =
        case fromBase inputBase inputDigits of
            Nothing -> Nothing
            Just num -> toBase outputBase num