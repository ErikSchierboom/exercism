module Triangle (TriangleType(..), triangleType) where

import qualified Data.Set as Set

data TriangleType = Equilateral | Isosceles | Scalene | Illogical
    deriving (Eq, Show)

triangleType :: Int -> Int -> Int -> TriangleType
triangleType x y z 
    | isEmpty || inInvalid = Illogical
    | otherwise = case equalSides of 2 -> Isosceles
                                     1 -> Equilateral
                                     _ -> Scalene 
    where
        isEmpty = x == 0 && y == 0 && z == 0
        inInvalid = x + y <= z || x + z <= y || y + z <= x
        equalSides = Set.size $ Set.fromList [x, y, z]