// Playground - noun: a place where people can play

import Foundation

let keyString : NSString = "one two three four five"
var keys : NSArray = keyString.componentsSeparatedByString(" ")

let valueString : NSString = "alpha bravo charlie delta echo"
var values : NSArray = valueString.componentsSeparatedByString(" ")

var dict : NSDictionary = NSDictionary(objects:values as [AnyObject], forKeys:keys as! [NSCopying])

NSLog("%@", dict.description)

var value:NSString = dict.objectForKey("three") as! NSString
NSLog("three = %@", value)

var kys = dict.allKeys
for item : AnyObject in kys {
    var key = item as! NSString
    NSLog("%@ - %@", key, dict.objectForKey(key) as! NSString)
}
