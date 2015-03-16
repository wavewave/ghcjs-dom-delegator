module Main where

import GHCJS.Foreign
--
import GHCJS.DOMDelegator


main :: IO ()
main = do 
    putStrLn "hellow world!"
    -- ref <- newObj
    del <- domDelegator -- ref

    putStrLn "hellow world2"
