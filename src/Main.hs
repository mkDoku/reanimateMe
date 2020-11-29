#!/usr/bin/env stack
-- stack runghc --package reanimate

module Main ( main ) where

import           Reanimate
import           Reanimate.Builtin.Documentation
import           Reanimate.Transition

main :: IO ()
main = reanimate $ docEnv $ playThenReverseA drawCircle
