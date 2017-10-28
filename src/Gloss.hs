import Graphics.Gloss
import Geobox.LatLon
import Geobox.Angle
import Geobox.Paper.Marker
import Geobox.Paper.Colour
import qualified Geobox.Lambert as Lam
import Geobox.Length

simpleTriangleMarker :: LatLon -> Marker LatLon
simpleTriangleMarker p = Marker p "" (fromRGB 1 0 0) Triangle

a, b, c :: Marker LatLon
a = simpleTriangleMarker $ fromLatLon (deg (-37.842300)) (deg 144.905712)
b = simpleTriangleMarker $ fromLatLon (deg (-39.114186)) (deg 146.400726)
c = simpleTriangleMarker $ fromLatLon (deg (-38.853949)) (deg 143.517424)

projectionAroundMelbourne :: Lam.LambertProjection
projectionAroundMelbourne =
  Lam.makeLambertProjection (fromLatLon (deg (-37.842300)) (deg 144.905712)) (deg (-32)) (deg (-44))

markerPicture :: Marker LatLon -> Picture
markerPicture m =
  let m' = project (Lam.project projectionAroundMelbourne) m :: Marker (Length,Length)
      (x, y) = position m'
      g = realToFrac . getMetres
  in Translate (g x) (g y) (Circle 1)

simplePoints :: Picture
simplePoints = mconcat (map markerPicture [a, b, c])

main :: IO ()
main = display (InWindow "Geobox" (400, 400) (10, 10)) white simplePoints
