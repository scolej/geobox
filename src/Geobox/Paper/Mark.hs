module Geobox.Paper.Mark
  ( Kind
  , Mark(..)
  ) where

import Geobox.Paper.Colour
import Geobox.EastNorth

data Kind
  = Cross
  | UpTriangle
  | Square

data Mark = Mark EastNorth Kind Colour
