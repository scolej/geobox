module Geobox.Lambert
  ( project
  , makeLambertProjection
  , LambertProjection
  ) where

import Geobox.Angle
import Geobox.LatLon
import Geobox.Length

data LambertProjection = LambertProjection
  { referenceLat :: Radians
  , referenceLon :: Radians
  , standardParallel1 :: Radians
  , standardParallel2 :: Radians
  , cachedN :: Double
  }

sec x = 1 / cos x

cot x = 1 / tan x

makeLambertProjection :: LatLon -> Degrees -> Degrees -> LambertProjection
makeLambertProjection ref stdP1 stdP2 =
  makeLambertProjectionRad
    (toRadians (latitude ref))
    (toRadians (longitude ref))
    (toRadians stdP1)
    (toRadians stdP2)

makeLambertProjectionRad :: Radians
                         -> Radians
                         -> Radians
                         -> Radians
                         -> LambertProjection
makeLambertProjectionRad refLat refLon stdP1 stdP2 =
  let n =
        (log (cos stdP1 * sec stdP2)) /
        (log (tan (pi / 4 + stdP2 / 2) * cot (pi / 4 + stdP1 / 2)))
  in LambertProjection refLat refLon stdP1 stdP2 n

earthRadius :: Length
earthRadius = kilometres 6371

project :: LambertProjection -> LatLon -> (Length, Length)
project p ll = (scaleToMetres x, scaleToMetres y)
  where
    scaleToMetres z = metres (z * getMetres earthRadius)
    lat = toRadians $ latitude ll
    lon = toRadians $ longitude ll
    refLat = referenceLat p
    refLon = referenceLon p
    n = cachedN p
    rho = f * (cot (pi / 4 + lat / 2) ** n)
    rho0 = f * (cot (pi / 4 + refLat / 2) ** n)
    f =
      cos (standardParallel1 p) * (tan (pi / 4 + standardParallel1 p / 2) ** n) /
      n
    x = rho * sin (n * (lon - refLon))
    y = rho0 - rho * cos (n * (lon - refLon))
