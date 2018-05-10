module Main where

import Control.Monad (when)

import qualified SDL
import qualified SDL.Font as SDLF

main :: IO ()
main = do
  SDL.initializeAll
  putStrLn "Should we attempt to initialize sdl2-ttf?"
  shouldInitTTF <- (=="yes") <$> getLine
  when shouldInitTTF SDLF.initialize