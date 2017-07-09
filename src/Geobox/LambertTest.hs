module Geobox.LambertTest
  ( tests
  ) where

import Geobox.Angle
import Geobox.Lambert
import Geobox.LatLon
import Geobox.Length
import Test.Tasty
import Test.Tasty.HUnit

tests :: TestTree
tests =
  testGroup "Lambert conformal conic projection tests." [centreTest, offsetTest]

alchemist :: LatLon
alchemist = fromLatLon (deg (-37.811881)) (deg 144.960246)

birchip :: LatLon
birchip = fromLatLon (deg (-35.991247)) (deg 142.911248)

standardParallel1 :: Degrees
standardParallel1 = deg (-10)

standardParallel2 :: Degrees
standardParallel2 = deg (-44)

lam :: LambertProjection
lam = makeLambertProjection alchemist standardParallel1 standardParallel2

centreTest :: TestTree
centreTest =
  testCase
    "Project a position exactly at the reference latitude and longitude."
    (project lam alchemist @?= (metres 0, metres 0))

offsetTest :: TestTree
offsetTest =
  testCase
    "Project a position that is offset from the reference latitude and longitude."
    (project lam birchip @?=
     (metres (-178294.05040034145), metres 194864.33489810413))
       -- TODO Massive cheat. Think of better test case.
