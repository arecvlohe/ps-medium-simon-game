module Main where

import Prelude

import Control.Monad.Eff (Eff)
import Pux (CoreEffects, start)
import Pux.Renderer.React (renderToDOM)


-- LOCAL

import App.View (view)
import App.Update (foldp, init, AppEffects)

main :: Eff (CoreEffects AppEffects) Unit
main = do
  app <- start
    { initialState: init
    , view
    , foldp
    , inputs: []
    }

  renderToDOM "#app" app.markup app.input
