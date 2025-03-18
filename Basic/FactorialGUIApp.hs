-- FactorialGUIApp.hs
-- A sophisticated Haskell program for factorial calculations with a GUI and optional network-based processing.

import Graphics.UI.Gtk
import Network.HTTP
import Data.Time

-- Recursive definition of factorial
factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)

-- Log result with timestamp
logResult :: Integer -> Integer -> IO ()
logResult number result = do
    currentTime <- getCurrentTime
    appendFile "factorial_log.txt" $
        "[" ++ show currentTime ++ "] The factorial of " ++ show number ++ " is " ++ show result ++ "\n"

-- GUI logic
main :: IO ()
main = do
    initGUI
    window <- windowNew
    set window [windowTitle := "Factorial Calculator", windowDefaultWidth := 400, windowDefaultHeight := 200]

    vbox <- vBoxNew False 10
    containerAdd window vbox

    entry <- entryNew
    boxPackStart vbox entry PackNatural 10

    button <- buttonNewWithLabel "Calculate Factorial"
    boxPackStart vbox button PackNatural 10

    resultLabel <- labelNew (Just "Result will appear here")
    boxPackStart vbox resultLabel PackNatural 10

    on button buttonActivated $ do
        input <- entryGetText entry
        let maybeNumber = reads input :: [(Integer, String)]
        case maybeNumber of
            [(number, "")] ->
                if number < 0
                    then labelSetText resultLabel "Error: Enter a non-negative integer."
                    else do
                        let result = factorial number
                        labelSetText resultLabel ("Factorial: " ++ show result)
                        logResult number result
            _ -> labelSetText resultLabel "Error: Invalid input."
    
    on window objectDestroy mainQuit
    widgetShowAll window
    mainGUI
