module POV (Graph(..), fromPOV, tracePathBetween) where
 
import Data.Maybe (listToMaybe, catMaybes)
 
data Graph a = Graph { 
    value :: a, 
    children :: [Graph a] 
} deriving (Show, Eq)

data Crumb a = Crumb a [Graph a] [Graph a] deriving (Show)
type Zipper a = (Graph a, [Crumb a])  

goDown :: Zipper a -> Maybe (Zipper a)  
goDown (Graph x (y:ys), crumbs) = Just (y, Crumb x [] ys:crumbs) 
goDown _ = Nothing

goRight :: Zipper a -> Maybe (Zipper a)  
goRight (current, Crumb x left (r:right):crumbs) = Just (r, Crumb x (left ++ [current]) right:crumbs)  
goRight _ = Nothing

findNode :: Eq a => a -> Zipper a -> Maybe (Zipper a)  
findNode x zipper@(focus, _) = 
    if value focus == x then Just zipper
    else listToMaybe $ catMaybes $ findDown:[findRight]
        where findDown = goDown zipper >>= findNode x
              findRight = goRight zipper >>= findNode x
              
changeParent :: Eq a => Zipper a -> Graph a
changeParent (focus, []) = focus
changeParent (Graph x xs, Crumb a left right:crumbs) = Graph x ys where
    parentGraph = changeParent (Graph a (left ++ right), crumbs)
    ys = xs ++ [parentGraph]
    
fromPOV :: Eq a => a -> Graph a -> Maybe (Graph a)
fromPOV x = fmap changeParent . findNode x . graphToZipper

tracePathBetween :: Eq a => a -> a -> Graph a -> Maybe [a]
tracePathBetween node1 node2 graph = 
    fmap zipperToPath $ fromPOV node1 graph >>= findNode node2 . graphToZipper

graphToZipper :: Graph a -> Zipper a
graphToZipper graph = (graph, [])

crumbValue :: Crumb a -> a
crumbValue (Crumb x _ _) = x

zipperToPath :: Zipper a -> [a]
zipperToPath (focus, crumbs) = reverse crumbValues ++ [value focus]
    where crumbValues = map crumbValue crumbs