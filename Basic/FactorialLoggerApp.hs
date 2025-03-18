-- FactorialLoggerApp.hs
-- A full-featured Haskell program for factorial calculations, including input validation, logging, and file output.

import System.IO
import Data.Time

-- Recursive definition of factorial
factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)

-- Log the result to a file with a timestamp
logResult :: Integer -> Integer -> IO ()
logResult number result = do
    currentTime <- getCurrentTime
    appendFile "factorial_log.txt" $
        "[" ++ show currentTime ++ "] The factorial of " ++ show number ++ " is " ++ show result ++ "\n"

-- Write the result to a separate file
writeResultToFile :: Integer -> Integer -> IO ()
writeResultToFile number result = do
    writeFile "factorial_result.txt" $
        "The factorial of " ++ show number ++ " is " ++ show result

-- Main function to handle user input and program execution
main :: IO ()
main = do
    putStrLn "Welcome to the Factorial Logger App!"
    putStrLn "Enter a non-negative integer:"
    input <- getLine
    let maybeNumber = reads input :: [(Integer, String)]
    case maybeNumber of
        [(number, "")] ->
            if number < 0
                then putStrLn "Factorials are only defined for non-negative integers. Please try again."
                else do
                    let result = factorial number
                    putStrLn ("The factorial of " ++ show number ++ " is " ++ show result)
                    logResult number result
                    writeResultToFile number result
                    putStrLn "The result has been logged and saved to files."
        _ -> putStrLn "Invalid input. Please enter a valid non-negative integer."
    putStrLn "Thank you for using the Factorial Logger App!"
