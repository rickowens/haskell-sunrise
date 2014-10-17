{-# LANGUAGE OverloadedStrings, NamedFieldPuns #-}
module Main (main) where

import Data.ByteString (ByteString)
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
  runMoonshine (\config ->
    route [
      ("/hello", hello config)
    ]
  )


-- Private Types --------------------------------------------------------------

data Config =
  Config {
    salutation :: ByteString
  }


-- Private Functions ----------------------------------------------------------

hello :: Config -> Snap ()
hello Config {salutation} = do
  writeBS salutation
  writeBS "\n"


