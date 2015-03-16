/*
  to generate lib.js, install dom-delegator and process file:

     $ npm install
     $ grunt
 */

var Delegator = require('dom-delegator');
var DOMDelegator = require('dom-delegator/dom-delegator');
var addEvent = require('dom-delegator/add-event');
var removeEvent = require('dom-delegator/remove-event');
var ProxyEvent = require('dom-delegator/proxy-event');

module.exports = { addEvent:     addEvent,
                   DOMDelegator: DOMDelegator,
                   Delegator:    Delegator,
                   ProxyEvent:   ProxyEvent,
                   removeEvent:  removeEvent
                 };

// the global variable we're using in the bindings
h$domDelegator = module.exports;
// h$registerExtensibleRetention(scanTree);


console.log(DOMDelegator);
console.log("-----------------");
console.log(h$domDelegator.DOMDelegator);