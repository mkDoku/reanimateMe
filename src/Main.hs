#!/usr/bin/env stack
-- stack runghc --package reanimate

module Main ( main ) where

import           Reanimate
import           Reanimate.Builtin.Documentation
import           Reanimate.Transition

customDuration = 1

main :: IO ()
main = reanimate
  $ docEnv
  $ chainT andThen [ani1, ani2, ani3, ani4, ani5]

-- Helper functions creating a `Animation` from two coordinates
animatePart :: (Double, Double) -> (Double, Double) -> Animation
animatePart coord1 coord2 = setDuration customDuration $
  animate $ \t ->
    partialSvg t $ pathify $ mkLine coord1 coord2

-- Some animations
ani1 = animatePart leftBottom middleTop
ani2 = animatePart middleTop rightBottom
ani3 = animatePart rightBottom leftCustom
ani4 = animatePart leftCustom rightCustom
ani5 = animatePart rightCustom leftBottom

-- Some coordinates
leftBottom   = (screenLeft, screenBottom)
middleTop    = (0, screenTop)
rightBottom  = (screenRight, screenBottom)
customHeigth = 1
leftCustom   = (screenLeft, customHeigth)
rightCustom  = (screenRight, customHeigth)
