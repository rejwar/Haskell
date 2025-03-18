module MatchRecords where

data Person = Person { name :: String, age :: Int }
  deriving (Show)

isAdult :: Person -> Bool
isAdult (Person _ age) = age >= 18
