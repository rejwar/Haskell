module MatchLists where

sumList :: [Int] -> Int
sumList []       = 0
sumList (x:xs)   = x + sumList xs
