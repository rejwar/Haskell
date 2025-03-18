module MatchNestedLists where

countNestedLists :: [[a]] -> Int
countNestedLists []       = 0
countNestedLists ([]:xs)  = countNestedLists xs
countNestedLists ((_:_):xs) = 1 + countNestedLists xs
