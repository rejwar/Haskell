module AnimalExample where

data Animal
  = Dog { dogName :: String, dogAge :: Int }
  | Cat { catName :: String, catLives :: Int }
  | Fish { fishSpecies :: String }
  deriving (Show)
