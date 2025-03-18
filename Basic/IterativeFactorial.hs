factorial :: Integer -> Integer
factorial n = product [1..n]

main :: IO ()
main = do
    putStrLn "Enter a number:"
    input <- getLine
    print (factorial (read input))
