module BinaryTree where

data Tree a = Leaf | Node a (Tree a) (Tree a)
  deriving (Show)
