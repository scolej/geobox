module Geobox.EastNorth
  ( EastNorth(..)
  ) where

import Geobox.Length

data EastNorth = EastNorth
  { easting :: Length
  , northing :: Length
  }
