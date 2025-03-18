-- AdvancedFactorialApp.hs
-- A robust Haskell program for calculating factorials, with error handling, multiple calculations, and user-friendly interactions.

-- Recursive definition of factorial
factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)

-- Helper function to display a menu
menu :: IO ()
menu = do
    putStrLn "===================================="
    putStrLn "        Advanced Factorial App       "
    putStrLn "===================================="
    putStrLn "1. Calculate a factorial"
    putStrLn "2. Exit"
    putStrLn "===================================="

-- Main logic for the program
main :: IO ()
main = do
    putStrLn "Welcome to the Advanced Factorial Calculator!"
