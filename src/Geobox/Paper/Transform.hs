module Geobox.Paper.Transform where

import Geobox.EastNorth
import Geobox.Geometry

data PaperTransform = PaperTransform
  { mapScale :: Double -- ^ Scale between length and paper units.
  , mapCentre :: EastNorth -- ^ Focus point of the map.
  , paperScale :: Double -- ^ Scaling to apply to a map element. Eg: make a point marker bigger.
  , paperOffset :: V2 -- ^ Offset a map element by this much distance on paper.
  }

EastNorth -> V2 -> V2

V2 -> V2

EastNorth -> V2

-- | Build a transform to use when drawing.
transform :: PaperTransform -> EastNorth -> V2 -> V2
transform t (EastNorth e n) (V2 x y) = V2 x' y'
  where
    x' = undefined
    y' = undefined



