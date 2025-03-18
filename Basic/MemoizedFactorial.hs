import qualified Data.Map as Map

factorial :: Integer -> Integer
factorial n = memo Map.! n
  where
    memo = Map.fromList $ map (\x -> (x, fact x)) [0..]
    fact 0 = 1
    fact x = x * memo Map.! (x - 1)

main :: IO ()
main = do
    putStrLn "Enter a number:"
    input <- getLine
    print (factorial (read input))
