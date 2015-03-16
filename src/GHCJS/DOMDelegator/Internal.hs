module GHCJS.DOMDelegator.Internal where

import Language.Haskell.TH.Quote

import GHCJS.Foreign.QQ
import GHCJS.Types 

foreign import javascript unsafe "h$domDelegator.addEvent($1,$2,$3)" 
  js_add_event :: JSRef a -> JSString -> JSFun (JSRef b -> IO c) -> IO ()

foreign import javascript unsafe "h$domDelegator.DOMDelegator()" 
  js_dom_delegator :: IO (JSRef a)

foreign import javascript unsafe "h$domDelegator.Delegator($1)"
  js_delegator :: JSRef a -> IO (JSRef b)

foreign import javascript unsafe "h$domDelegator.ProxyEvent($1)" 
  js_proxy_event :: JSRef a -> IO (JSRef b)

foreign import javascript unsafe "h$domDelegator.removeEvent($1,$2,$3)" 
  js_remove_event :: JSRef a -> JSString -> JSFun (JSRef b -> IO c) -> IO ()
