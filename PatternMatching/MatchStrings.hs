module MatchStrings where

greet :: String -> String
greet "Alice" = "Hello, Alice!"
greet "Bob"   = "Hello, Bob!"
greet _       = "Hello, stranger!"
