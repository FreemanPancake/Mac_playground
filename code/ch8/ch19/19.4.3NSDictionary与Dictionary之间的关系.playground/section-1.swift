// Playground - noun: a place where people can play

import Foundation

let keyString : NSString = "one two three four five"
let keys : NSArray = keyString.componentsSeparatedByString(" ")
let valueString : NSString = "alpha bravo charlie delta echo"
let values : NSArray = valueString.componentsSeparatedByString(" ")
let foundationDict : NSDictionary = NSDictionary(objects:values, forKeys:keys)
let swiftDict : Dictionary = foundationDictprintln(swiftDict.description)
let value: AnyObject? = swiftDict["three"]println("three = \(value)")
for (key, value) in swiftDict {    println ("\(key) - \(value)")
}
