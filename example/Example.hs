{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE JavaScriptFFI #-}
{-# LANGUAGE OverloadedStrings #-}

module Main where

import Control.Monad.Trans
import Control.Monad.Trans.Maybe
import GHCJS.DOM
import GHCJS.DOM.Document
import GHCJS.Foreign
import GHCJS.Marshal
import GHCJS.Types
--
import GHCJS.DOMDelegator

foreign import javascript unsafe "function{ return document; }" js_document  :: IO (JSRef ())
foreign import javascript unsafe "$1['querySelector']($2)" 
  js_query_selector :: JSRef () -> JSString -> IO (JSRef ())


func :: a -> IO ()
func _ = putStrLn "func is called"

main :: IO ()
main = do 
    funccb <- asyncCallback1 AlwaysRetain func
    putStrLn "hellow world!"
    r <- runMaybeT $ do
      doc <- MaybeT currentDocument
      foo <- MaybeT (documentQuerySelector doc (".foo" :: JSString))
      lift $ do
        ref <- newObj
        del <-delegator ref
        fooref <- toJSRef foo
        addEvent fooref "click" funccb
        putStrLn "hellow world2"
    case r of
      Nothing -> print "something wrong"
      Just _ -> print "welldone"
