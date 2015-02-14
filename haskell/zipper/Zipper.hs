module Zipper (
    BinTree(..),
    Zipper,

    fromTree,
    toTree,

    value,
    left,
    right,
    up,

    setValue,
    setLeft,
    setRight
) where

-- | A binary tree.
data BinTree a = BT { 
    btValue :: a                 -- ^ Value
  , btLeft  :: Maybe (BinTree a) -- ^ Left child
  , btRight :: Maybe (BinTree a) -- ^ Right child
} deriving (Eq, Show)

-- | A zipper for a binary tree.
data Zipper a = Z {
    zValue :: a                 -- ^ Value
  , zLeft  :: Maybe (BinTree a) -- ^ Left child
  , zRight :: Maybe (BinTree a) -- ^ Right childzFocus :: BinTree a  
  , zCrumbs :: Breadcrumbs a
} deriving (Eq, Show)

data Crumb a = LeftCrumb a (Maybe (BinTree a)) | RightCrumb a (Maybe (BinTree a)) deriving (Eq, Show)  

type Breadcrumbs a = [Crumb a]

-- | Get a zipper focussed on the root node.
fromTree :: BinTree a -> Zipper a
fromTree (BT tv tl tr) = Z tv tl tr []

-- | Get the complete tree from a zipper.
toTree :: Zipper a -> BinTree a
toTree (Z zv zl zr cs) = toTreeLoop (BT zv zl zr) cs

toTreeLoop :: BinTree a -> Breadcrumbs a -> BinTree a
toTreeLoop t [] = t
toTreeLoop t (LeftCrumb tv tr:cs) = toTreeLoop (BT tv (Just t) tr) cs
toTreeLoop t (RightCrumb tv tl:cs) = toTreeLoop (BT tv tl (Just t)) cs

-- | Get the value of the focus node.
value :: Zipper a -> a
value = zValue

-- | Get the left child of the focus node, if any.
left :: Zipper a -> Maybe (Zipper a)
left (Z _ Nothing _ _) = Nothing
left (Z zv (Just (BT tv tl tr)) zr zc) = Just (Z tv tl tr (LeftCrumb zv zr:zc))

-- | Get the right child of the focus node, if any.
right :: Zipper a -> Maybe (Zipper a)
right (Z _ _ Nothing _) = Nothing
right (Z zv zl (Just (BT tv tl tr)) zc) = Just (Z tv tl tr (RightCrumb zv zl:zc))

-- | Get the parent of the focus node, if any.
up :: Zipper a -> Maybe (Zipper a)
up (Z _ _ _ []) = Nothing
up (Z zv zl zr (LeftCrumb tv tr:cs)) = Just $ (Z tv (Just (BT zv zl zr)) tr cs)
up (Z zv zl zr (RightCrumb tv tl:cs)) = Just $ (Z tv tl (Just (BT zv zl zr)) cs)

-- | Set the value of the focus node.
setValue :: a -> Zipper a -> Zipper a
setValue tv zipper = zipper { zValue = tv }

-- | Replace a left child tree.
setLeft :: Maybe (BinTree a) -> Zipper a -> Zipper a
setLeft tl zipper = zipper { zLeft = tl }

-- | Replace a right child tree.
setRight :: Maybe (BinTree a) -> Zipper a -> Zipper a
setRight tr zipper = zipper { zRight = tr }