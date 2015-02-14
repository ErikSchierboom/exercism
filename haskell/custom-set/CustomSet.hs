module CustomSet (
    CustomSet, 
    union, 
    intersection, 
    difference,
    insert,
    delete,
    member,
    null, 
    toList, 
    fromList, 
    size,
    empty, 
    isSubsetOf, 
    isDisjointFrom
) where

import qualified Data.List as L
import Prelude hiding (null)

newtype CustomSet a = CustomSet { unCustomSet :: [a] }
    deriving (Eq)

instance Show a => Show (CustomSet a) where
  show (CustomSet list) = "fromList " ++ show list

null :: CustomSet a -> Bool
null = L.null . unCustomSet

insert :: Ord a => a -> CustomSet a -> CustomSet a
insert value set = fromList $ (value : unCustomSet set)

delete :: Ord a => a -> CustomSet a -> CustomSet a
delete value set = fromList $ (L.delete value $ unCustomSet set)

member :: Ord a => a -> CustomSet a -> Bool
member value = L.elem value . unCustomSet

union :: Ord a => CustomSet a -> CustomSet a -> CustomSet a
union left right = fromList $ unCustomSet left `L.union` unCustomSet right

intersection :: Ord a => CustomSet a -> CustomSet a -> CustomSet a
intersection left right = fromList $ unCustomSet left `L.intersect` unCustomSet right

difference :: Ord a => CustomSet a -> CustomSet a -> CustomSet a
difference left right = fromList $ unCustomSet left L.\\ unCustomSet right

size :: CustomSet a -> Int
size = L.length . unCustomSet

empty :: CustomSet a
empty = CustomSet ([])

toList :: CustomSet a -> [a]
toList = unCustomSet

fromList :: Ord a => [a] -> CustomSet a
fromList = CustomSet . L.sort . L.nub

isSubsetOf :: Ord a => CustomSet a -> CustomSet a -> Bool
isSubsetOf subset superset = L.all (flip member superset) (unCustomSet subset)

isDisjointFrom :: Ord a => CustomSet a -> CustomSet a -> Bool
isDisjointFrom left right = not $ L.any (flip member right) (unCustomSet left)