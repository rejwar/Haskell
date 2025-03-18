-- FactorialConfigApp.hs
-- A Haskell program for factorial calculations with configuration file support and batch processing.

import System.IO
import Data.Time
import System.Environment (getArgs)

-- Recursive definition of factorial
factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)

-- Load configuration from a file
loadConfig :: FilePath -> IO [(String, String)]
loadConfig path = do
    content <- readFile path
    return $ map (\line -> let (key, value) = break (== '=') line in (key, drop 1 value)) (lines content)

-- Log the result to a file with a timestamp
logResult :: Integer -> Integer -> IO ()
logResult number result = do
    currentTime <- getCurrentTime
    appendFile "factorial_log.txt" $
        "[" ++ show currentTime ++ "] The factorial of " ++ show number ++ " is " ++ show result ++ "\n"

-- Process a single number based on configuration
processNumber :: [(String, String)] -> Integer -> IO ()
processNumber config number = do
    let result = factorial number
    case lookup "output" config of
        Just "console" -> putStrLn ("The factorial of " ++ show number ++ " is " ++ show result)
        Just "file" -> do
            writeFile "factorial_result.txt" $ "The factorial of " ++ show number ++ " is " ++ show result
            putStrLn "Result saved to factorial_result.txt"
        _ -> putStrLn "Invalid configuration for output."
    logResult number result

-- Main function to handle user input and batch processing
main :: IO ()
main = do
    args <- getArgs
    config <- loadConfig "factorial_config.txt"
    case args of
        [] -> do
            putStrLn "Enter a non-negative integer:"
            input <- getLine
            let maybeNumber = reads input :: [(Integer, String)]
            case maybeNumber of
                [(number, "")] ->
                    if number < 0
                        then putStrLn "Factorials are only defined for non-negative integers."
                        else processNumber config number
                _ -> putStrLn "Invalid input. Please enter a valid integer."
        _ -> do
            let numbers = map read args :: [Integer]
            mapM_ (processNumber config) numbers
    putStrLn "Thank you for using the Factorial Config App!"
