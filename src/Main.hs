#!/usr/bin/env stack
-- stack runghc --package reanimate

module Main ( main ) where

import           Reanimate
import           Reanimate.Builtin.Documentation
import           Reanimate.Transition

main :: IO ()
main = reanimate
  $ docEnv
  $ setDuration 5
  $ animate
  $ \t -> partialSvg t
  $ pathify customPath

customPath :: SVG
customPath =
  mkLinePath
    [ leftBottom,
      middleTop,
      rightBottom,
      leftCustom,
      rightCustom,
      leftBottom
    ]

-- Some coordinates
leftBottom   = (screenLeft  , screenBottom)
middleTop    = (0           , screenTop   )
rightBottom  = (screenRight , screenBottom)
customHeigth = 1
leftCustom   = (screenLeft  , customHeigth)
rightCustom  = (screenRight , customHeigth)
