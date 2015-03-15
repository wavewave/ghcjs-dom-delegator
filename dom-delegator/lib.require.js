/*
  to generate lib.js, install dom-delegator and process file:

     $ npm install
     $ grunt
 */

var DOMDelegator = require('dom-delegator');

module.exports = { addEvent:     DOMDelegator.addEvent,
                   DOMDelegator: DOMDelegator.DomDelegator,
                   Delegator:    DOMDelegator.Delegator,
                   ProxyEvent:   DOMDelegator.ProxyEvent,
                   removeEvent:  DOMDelegator.removeEvent
                 };

// the global variable we're using in the bindings
h$domDelegator = module.exports;
// h$registerExtensibleRetention(scanTree);
