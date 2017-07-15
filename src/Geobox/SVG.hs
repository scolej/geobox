module Geobox.SVG
  ( renderSVGElements
  ) where

import Geobox.EastNorth
import Geobox.Paper.Colour
import Geobox.Paper.Mark
import Text.XML.Light.Types

qname :: String -> QName
qname s = QName s Nothing Nothing

class SVGRenderable a where
  renderSVGElements :: a -> [Element]

-- <polygon points="200,10 250,190 160,210" style="fill:lime;stroke:purple;stroke-width:1" />
instance SVGRenderable Mark where
  renderSVGElements (Mark (EastNorth east north) kind colour) =
    [Element (qname "polygon") [] [] Nothing]

data V2 =
  V2 Double
     Double

type Transform2D = V2 -> V2

triangle :: Transform2D -> [Element]
triangle t =
  [ Element
      (qname "polygon")
      [ Attr (qname "points") (renderV2 (map t equilateralTrianglePoints))
      , Attr (qname "style") "fill:none,stroke:black"
      ]
      []
      Nothing
  ]

halfRoot3 :: Double
halfRoot3 = sqrt 3 / 2

equilateralTrianglePoints :: [V2]
equilateralTrianglePoints = [V2 0 halfRoot3, V2 1 (-halfRoot3), V2 (-1) (-halfRoot3)]

wrapSvg :: [Element] -> Element
wrapSvg es = Element (qname "svg") [] (map Elem es) Nothing

renderV2 :: [V2] -> String
renderV2 vs = unwords (map f vs)
  where f (V2 x y) = show x ++ "," ++ show y

scale :: Double -> Transform2D
scale s (V2 x y) = V2 (x * s) (y * s)
