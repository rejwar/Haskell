-- FactorialApp.hs
-- A comprehensive Haskell program to calculate the factorial of a number
-- Includes edge case handling for negative inputs

-- Recursive definition of factorial
factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)

-- Main function to read input, validate it, and display the factorial
main :: IO ()
main = do
    putStrLn "Welcome to the Factorial Calculator!"
    putStrLn "Enter a non-negative integer:"
    input <- getLine
    let number = read input :: Integer
    if number < 0
        then putStrLn "Factorials are only defined for non-negative integers. Please try again."
        else putStrLn ("The factorial of " ++ show number ++ " is " ++ show (factorial number))
    putStrLn "Thank you for using the Factorial Calculator!"
