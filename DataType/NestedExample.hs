module NestedExample where

data Nested = Single Int | Multiple [Nested]
  deriving (Show)
