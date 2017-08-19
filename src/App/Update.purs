module App.Update
  ( State
  , AppEffects
  , foldp
  , init
  ) where

import Prelude

import Control.Monad.Aff (delay)
import Control.Monad.Eff.Console (CONSOLE)
import Data.Maybe (Maybe(..))
import Data.Time.Duration (Milliseconds(..))
import Pux (EffModel, noEffects)

-- LOCAL

import App.Events (Event(..))

type State =
  { currentColor :: String
  }

init :: State
init =
  { currentColor: ""
  }

type AppEffects = (console :: CONSOLE)

foldp :: Event -> State -> EffModel State Event AppEffects
foldp (UserClick color) state =
  { state: state { currentColor = color }
  , effects:
    [ delay (Milliseconds 300.0) $> Just ResetColor ]
  }

foldp ResetColor state = noEffects state { currentColor = "" }
