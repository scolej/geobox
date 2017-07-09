module Geobox.Domain.AirspaceVolume
  ( AirspaceVolume
  , airspaceFloor
  , airspaceCeiling
  , airspacePolygon
  ) where

import Geobox.Domain.Level
import Geobox.LatLon

data AirspaceVolume

airspaceFloor :: AirspaceVolume -> Level
airspaceFloor = undefined

airspaceCeiling :: AirspaceVolume -> Level
airspaceCeiling = undefined

airspacePolygon :: AirspaceVolume -> LatLonPolygon
airspacePolygon = undefined









