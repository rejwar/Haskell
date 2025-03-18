import Data.Time

factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)

main :: IO ()
main = do
    putStrLn "Enter a number:"
    input <- getLine
    let number = read input :: Integer
    let result = factorial number
    putStrLn $ "Factorial: " ++ show result
    currentTime <- getCurrentTime
    appendFile "log.txt" $ show currentTime ++ ": " ++ show number ++ " -> " ++ show result ++ "\n"
