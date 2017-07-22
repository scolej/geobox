module Geobox.Geometry where

data V2 =
  V2 Double
     Double

type Transform2D = V2 -> V2


halfRoot3 :: Double
halfRoot3 = sqrt 3 / 2

equilateralTrianglePoints :: [V2]
equilateralTrianglePoints = [V2 0 halfRoot3, V2 1 (-halfRoot3), V2 (-1) (-halfRoot3)]

scale :: Double -> Transform2D
scale s (V2 x y) = V2 (x * s) (y * s)
