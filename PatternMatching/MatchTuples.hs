module MatchTuples where

describeTuple :: (Int, Int) -> String
describeTuple (0, 0) = "Both are zero"
describeTuple (x, 0) = "First is non-zero, second is zero"
describeTuple (0, y) = "First is zero, second is non-zero"
describeTuple _      = "Both are non-zero"
