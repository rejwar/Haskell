factorial :: Integer -> Integer -> Integer
factorial acc 0 = acc
factorial acc n = factorial (acc * n) (n - 1)

main :: IO ()
main = do
    putStrLn "Enter a number:"
    input <- getLine
    print (factorial 1 (read input))
