factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)

main :: IO ()
main = do
    config <- readFile "config.txt"
    putStrLn "Enter a number:"
    input <- getLine
    let number = read input :: Integer
    let result = factorial number
    case config of
        "console\n" -> putStrLn $ "Factorial: " ++ show result
        "file\n" -> writeFile "result.txt" $ show result
