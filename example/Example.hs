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

foreign import javascript unsafe "alert($1)" js_message :: JSString -> IO ()

clickbar :: a -> IO ()
clickbar _ = js_message "bar was clicked"

clickbaz :: a -> IO ()
clickbaz _ = js_message "baz was clicked"


main :: IO ()
main = do 
    clickbarref <- asyncCallback1 AlwaysRetain clickbar
    clickbazref <- asyncCallback1 AlwaysRetain clickbaz
    r <- runMaybeT $ do
      doc <- MaybeT currentDocument
      bar <- lift . toJSRef =<< MaybeT (documentQuerySelector doc (".bar" :: JSString))
      baz <- lift . toJSRef =<< MaybeT (documentQuerySelector doc (".baz" :: JSString))
      lift $ do
        ref <- newObj
        del <-delegator ref
        addEvent bar "click" clickbarref
        addEvent baz "click" clickbazref

    case r of
      Nothing -> print "something wrong"
      Just _ -> print "welldone"
