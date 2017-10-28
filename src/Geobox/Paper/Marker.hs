module Geobox.Paper.Marker where

import Geobox.Paper.Colour

data Shape = Triangle

data Marker a = Marker
  { position :: a
  , label :: String
  , colour :: Colour
  , shape :: Shape
  }

class Projectable p where
  project :: (a -> b) -> p a -> p b

instance Projectable Marker where
  project p m = let pos = position m
                    pos' = p pos
                in m { position = pos' }
