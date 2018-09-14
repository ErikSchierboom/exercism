module LinkedList where

data LinkedList a = Nil | Element a (LinkedList a)

nil :: LinkedList a
nil = Nil

isNil :: LinkedList a -> Bool
isNil Nil = True
isNil _ = False

new :: a -> LinkedList a -> LinkedList a
new x l = Element x l

next :: LinkedList a -> LinkedList a
next Nil = Nil
next (Element _ n) = n

datum :: LinkedList a -> a
datum Nil = error "Nil element has no datum"
datum (Element x _) = x

fromList :: [a] -> LinkedList a
fromList xs = foldr new Nil xs

toList :: LinkedList a -> [a]
toList Nil = []
toList (Element x n) = x : toList n

reverseLinkedList :: LinkedList a -> LinkedList a
reverseLinkedList l = fromList $ reverse $ toList l