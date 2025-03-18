module MatchBinaryTree where

data Tree a = Leaf | Node a (Tree a) (Tree a)
  deriving (Show)

treeSize :: Tree a -> Int
treeSize Leaf           = 0
treeSize (Node _ l r)   = 1 + treeSize l + treeSize r
