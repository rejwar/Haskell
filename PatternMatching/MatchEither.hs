module MatchEither where

data Either' a b = Left' a | Right' b
  deriving (Show)

processEither :: Either' Int String -> String
processEither (Left' num)   = "Number: " ++ show num
processEither (Right' text) = "Text: " ++ text
