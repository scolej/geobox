module Geobox.LatLon
  ( LatLon
  , LatLonVertices
  , LatLonPolygon
  , fromIcao
  , showIcao11
  , showIcao15
  , latitude
  , longitude
  , fromLatLon
  ) where

import Geobox.Angle

data LatLon = LatLon Degrees Degrees

latitude :: LatLon -> Degrees
latitude (LatLon lat _) = lat

longitude :: LatLon -> Degrees
longitude (LatLon _ lon) = lon

fromLatLon :: Degrees -> Degrees -> LatLon
fromLatLon lat lon = LatLon lat lon

fromIcao :: String -> Maybe LatLon
fromIcao = undefined

showIcao11 :: LatLon -> String
showIcao11 = undefined

showIcao15 :: LatLon -> String
showIcao15 = undefined

type LatLonVertices = [LatLon]

type LatLonPolygon = [LatLon]
