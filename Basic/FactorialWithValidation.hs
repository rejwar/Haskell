factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)

main :: IO ()
main = do
    putStrLn "Enter a non-negative number:"
    input <- getLine
    let number = read input :: Integer
    if number < 0
        then putStrLn "Factorial is undefined for negative numbers."
        else print (factorial number)
