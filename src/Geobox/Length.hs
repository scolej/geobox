module Geobox.Length
  ( Length
  , metres
  , kilometres
  , nauticalMiles
  , getMetres
  ) where

-- | A length measurement. Internally represented as metres.
newtype Length = Metres
  { getMetres :: Double
  } deriving (Eq, Show, Ord)

metres :: Double -> Length
metres x = Metres x

kilometres :: Double -> Length
kilometres x = Metres (x * 1000)

nauticalMiles :: Double -> Length
nauticalMiles x = undefined
