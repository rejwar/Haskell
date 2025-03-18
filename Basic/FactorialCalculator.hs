-- FactorialCalculator.hs
-- A simple Haskell program to calculate the factorial of a number

-- Recursive definition of factorial
factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)

-- Main function to read input and display the factorial
main :: IO ()
main = do
    putStrLn "Enter a number:"
    input <- getLine
    let number = read input :: Integer
    putStrLn ("The factorial of " ++ show number ++ " is " ++ show (factorial number))
