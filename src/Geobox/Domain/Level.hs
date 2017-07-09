module Geobox.Domain.Level
  ( Level
  , flightLevel
  ) where

newtype Level = Level Float

flightLevel :: Int -> Level
flightLevel l = Level (fromIntegral l)
