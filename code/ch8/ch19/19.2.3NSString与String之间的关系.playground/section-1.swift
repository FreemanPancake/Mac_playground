// Playground - noun: a place where people can play

import Foundation

let foundationString : NSString = "alpha bravo charlie delta echo"

let swiftString : String = foundationString
let foundationString2 : NSString = swiftString

let swiftArray : Array = swiftString.componentsSeparatedByString(" ")

let intString : NSString = "456"
let intValue = (intString as String).toInt()
