#!/usr/bin/env stack
-- stack runghc --package reanimate

module Main ( main ) where

import           Reanimate
import           Reanimate.Builtin.Documentation
import           Reanimate.Transition

main :: IO ()
main = reanimate
  $ docEnv
  $ animate
  $ \t -> partialSvg t
  $ pathify customLine

customLine :: SVG -- same as Tree
customLine = mkLine (screenLeft, screenBottom) (0, screenTop)
