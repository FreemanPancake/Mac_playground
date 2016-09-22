// Playground - noun: a place where people can play

import Foundation

var mutable : NSMutableDictionary = NSMutableDictionary()
// add objects
mutable.setObject("Tom", forKey: "tom@jones.com")
mutable.setObject("Bob", forKey: "bob@dole.com")

NSLog("%@", mutable.description)

var keys = mutable.allKeys
for item : AnyObject in keys {
    var key = item as! NSString
    NSLog("%@ - %@", key, mutable.objectForKey(key) as! NSString)
}
