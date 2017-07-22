module Geobox.SVG where

import Geobox.Geometry
import Text.XML.Light.Types

-- | Helper to make simple names.
sname :: String -> QName
sname s = QName s Nothing Nothing

-- | Make a simple XML node which has a name, no children, and some
-- attributes.
snode :: QName -> [Attr] -> Element
snode name attrs = Element name attrs [] Nothing

-- | Wrap some elements up with the root SVG node.
wrapSvg :: [Element] -> Element
wrapSvg es =
  Element
    (sname "svg")
    [ Attr (sname "width") "20cm"
    , Attr (sname "height") "20cm"
    , Attr (sname "viewBox") "-1 -1 2 2"
    ]
    (map Elem es)
    Nothing

-- | Show a list of vectors as a coordinate list.
showV2s :: [V2] -> String
showV2s vs = unwords (map showV2 vs)

-- | Show a vector in a format for coordinate lists.
showV2 :: V2 -> String
showV2 (V2 x y) = show x ++ "," ++ show y

-- | An equilateral triangle.
triangle :: Transform2D -> Element
triangle t =
  snode
    (sname "polygon")
    [ Attr (sname "points") (showV2s (map t equilateralTrianglePoints))
    , Attr (sname "stroke") "black"
    , Attr (sname "stroke-width") "0.001cm"
    , Attr (sname "fill") "none"
    ]
