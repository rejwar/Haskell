module RecursiveList where

data List a = Empty | Cons a (List a)
  deriving (Show)
