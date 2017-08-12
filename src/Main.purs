module Main where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, logShow)
import Control.Monad.Eff.Random (RANDOM, randomInt)
import Data.List (List)
import Data.Unfoldable (replicateA)

generateRandoSequence :: ∀ eff. Eff (random :: RANDOM | eff) (List Int)
generateRandoSequence =
  replicateA 20 (randomInt 1 4)

main :: forall e. Eff (console :: CONSOLE, random :: RANDOM | e) Unit
main = do
  result <- generateRandoSequence
  logShow $ result
