import Data.Set
import System.Environment (getArgs)

-- count the number of houses visited by following orders in the input string.
countHouses :: String -> Int
countHouses = aux (singleton (0, 0)) (0, 0)
  where
    aux visited _ [] =
        size visited
    aux visited (i, j) (s:ss) =
        aux (insert next visited) next ss
          where
            next = case s of
                      '>' -> (i, j+1)
                      'v' -> (i+1, j)
                      '<' -> (i, j-1)
                      '^' -> (i-1, j)
                      _   -> (i, j)

-- read the first command line argument, solve it and print it to stdout.
main :: IO()
main = getArgs >>= \a -> putStrLn . show $ countHouses (head a)
