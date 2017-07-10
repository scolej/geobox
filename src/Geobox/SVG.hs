module Geobox.SVG
  ( renderSVGElements
  ) where

import Text.XML.Light.Types
import Geobox.Paper.Mark
import Geobox.EastNorth

qname :: String -> QName
qname s = QName s Nothing Nothing

class SVGRenderable a where
  renderSVGElements :: a -> [Element]

-- <polygon points="200,10 250,190 160,210" style="fill:lime;stroke:purple;stroke-width:1" />
instance SVGRenderable Mark where
  renderSVGElements (Mark (EastNorth east north) kind colour) =
    [Element (qname "polygon") [] [] Nothing]
