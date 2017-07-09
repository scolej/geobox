module Geobox.Angle
  ( Degrees
  , Radians
  , toRadians
  , deg
  ) where

newtype Degrees = Degrees Double

deg :: Double -> Degrees
deg d = Degrees d

type Radians = Double

toRadians :: Degrees -> Radians
toRadians (Degrees d) = d / 180 * pi
