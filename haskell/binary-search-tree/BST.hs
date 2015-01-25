module BST (bstLeft, bstRight, bstValue, singleton, insert, fromList, toList) where

import Data.List (foldl')

data Node a = Node { bstLeft :: Maybe (Node a), bstRight :: Maybe (Node a), bstValue :: a }

singleton :: a -> Node a
singleton value = Node { bstLeft = Nothing, bstRight = Nothing, bstValue = value }

insert :: (Ord a) => a -> Node a -> Node a
insert newValue tree 
    | newValue <= bstValue tree = tree { bstLeft = insertLoop newValue (bstLeft tree) }
    | otherwise = tree { bstRight = insertLoop newValue (bstRight tree) }

insertLoop :: (Ord a) => a -> Maybe (Node a) -> Maybe (Node a)
insertLoop newValue node = case node of
    Just tree -> Just (insert newValue tree)
    Nothing -> Just (singleton newValue)

fromList :: (Ord a) => [a] -> Node a
fromList [] = error "Cannot create tree from empty list"
fromList (x:xs) = foldl' (flip insert) (singleton x) xs

toList :: Node a -> [a]
toList = toListLoop . Just

toListLoop :: Maybe (Node a) -> [a]
toListLoop node = case node of
    Just (tree) -> toListLoop (bstLeft tree) ++ [bstValue tree] ++ toListLoop (bstRight tree)
    Nothing -> []