module Palindromes (largestPalindrome, smallestPalindrome) where

largestPalindrome :: (Integral a, Show a) => a -> a -> (a,[(a, a)])
largestPalindrome = palindromes maximum 

smallestPalindrome :: (Integral a, Show a) => a -> a -> (a,[(a, a)])
smallestPalindrome = palindromes minimum 

palindromes :: (Integral a, Show a) => ([a] -> a) -> a -> a -> (a, [(a, a)])
palindromes select minFactor maxFactor = (selected, selectedProducts) where
    allPalindromes = [(x * y, (x, y)) | y <- [minFactor..maxFactor], 
                                        x <- [minFactor..y],
                                        isPalindrome $ x * y]
    selected = select $ map fst allPalindromes
    selectedProducts = map snd $ filter ((== selected) . fst) allPalindromes

isPalindrome :: (Integral a, Show a) => a -> Bool
isPalindrome a = show a == (reverse $ show a)