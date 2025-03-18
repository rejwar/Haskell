factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)

main :: IO ()
main = do
    putStrLn "Enter numbers separated by spaces:"
    input <- getLine
    let numbers = map read (words input) :: [Integer]
    print (map factorial numbers)
