{-# LANGUAGE OverloadedStrings #-}
module Main (main) where

import Snap (Snap, writeBS)
import Web.Moonshine (runMoonshine, route)

-- Public Types ---------------------------------------------------------------
-- Semi-Public Types ----------------------------------------------------------
-- Public Functions -----------------------------------------------------------


{- |
  The idea here is that this is a test project to drive the development of the
  `moonshine` package.

  Preferably, the code written below should be basically complete, and this
  should cause some level of dropwizardy-type things to happen, whatever we
  decide those are. The only additional thing that should be added to this file
  that we know of is something to do with configuration.
-}
main :: IO ()
main =
  runMoonshine $ route [
    ("/hello", hello)
  ]


-- Private Types --------------------------------------------------------------
-- Private Functions ----------------------------------------------------------

hello :: Snap ()
hello = writeBS "hi!\n"


