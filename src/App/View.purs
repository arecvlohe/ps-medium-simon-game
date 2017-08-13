module App.View
  ( view
  ) where

import Prelude hiding (div)

import Text.Smolder.Markup (Markup, text)
import Text.Smolder.HTML (div)

view :: ∀ e. Markup e
view =
  div
    $ text "Hello, PureScript!"
