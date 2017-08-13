module Main where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, logShow)
import Control.Monad.Eff.Random (RANDOM, randomInt)
import Data.Foldable (for_)
import Data.List (List)
import Data.Unfoldable (replicateA)
import DOM (DOM)
import DOM.HTML (window)
import DOM.HTML.Types (htmlDocumentToNonElementParentNode)
import DOM.HTML.Window (document)
import DOM.Node.NonElementParentNode (getElementById)
import DOM.Node.Types (ElementId(..))
import Text.Smolder.Renderer.DOM (render)

-- LOCAL

import App.View (view)

generateRandoSequence :: ∀ eff. Eff (random :: RANDOM | eff) (List String)
generateRandoSequence =
  map (\v ->
    case v of
      1 -> "red"
      2 -> "yellow"
      3 -> "green"
      4 -> "blue"
      _ -> "Oh nose 👃"
  ) <$> replicateA 20 (randomInt 1 4)

main :: forall e. Eff (console :: CONSOLE, random :: RANDOM, dom :: DOM | e) Unit
main = do
  documentType <- document =<< window
  element <- getElementById (ElementId "app") $ htmlDocumentToNonElementParentNode documentType
  for_ element (render <@> view)
