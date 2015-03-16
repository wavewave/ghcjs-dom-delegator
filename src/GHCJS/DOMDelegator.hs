{-# LANGUAGE EmptyDataDecls #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE JavaScriptFFI #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeFamilies #-}

{-
   binding to dom-delegator library   

 -}

module GHCJS.DOMDelegator 
( addEvent
, domDelegator
, delegator
, proxyEvent
, removeEvent
) where

import GHCJS.DOMDelegator.Internal

addEvent = js_add_event

domDelegator = js_dom_delegator

delegator = js_delegator

proxyEvent = js_proxy_event

removeEvent = js_remove_event