{-# LANGUAGE OverloadedStrings, NamedFieldPuns, DeriveGeneric #-}
module Main (main) where

import Control.Monad.IO.Class (liftIO)
import Data.Yaml (FromJSON)
import GHC.Generics (Generic)
import Snap (writeBS)
import System.Random (randomIO)
import Web.Moonshine (runMoonshine, route, makeTimer, Timer, timerAdd,
  getUserConfig, liftSnap, Moonshine)
import qualified Data.ByteString.Char8 as BS

-- Public Types ---------------------------------------------------------------
-- Semi-Public Types ----------------------------------------------------------
-- Public Functions -----------------------------------------------------------


{- |
  The idea here is that this is a test project to drive the development of the
  `moonshine` package.

  Preferably, the code written below should be basically complete, and this
  should cause some level of dropwizardy-type things to happen, whatever we
  decide those are.
-}
main :: IO ()
main =
  runMoonshine $ do
    -- make a distribution
    timer <- makeTimer "some.kind.of.timer"
    route [
        ("/hello", hello timer)
      ]


-- Private Types --------------------------------------------------------------

data Config =
  Config {
    salutation :: String
  } deriving (Generic)

instance FromJSON Config

-- Private Functions ----------------------------------------------------------

hello :: Timer -> Moonshine Config ()
hello timer = do -- Moonshine monad
  Config {salutation} <- getUserConfig
  -- add some random value to the metrics we are tracking.
  timerAdd timer =<< liftIO (randomIO :: IO Float)
  liftSnap $ do -- snap monad
    writeBS $ BS.pack salutation
    writeBS "\n"


