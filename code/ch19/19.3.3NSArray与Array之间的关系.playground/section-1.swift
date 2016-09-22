// Playground - noun: a place where people can play

import Foundation

let foundationString : NSString = "alpha bravo charlie delta echo"
let foundationArray : NSArray = foundationString.componentsSeparatedByString(" ")
let swiftArray = foundationArray

for item in foundationArray  {
    print(item) //输出类型是NSString
}

for item in foundationArray as! [String] {
    print(item) //输出类型是String
}

for item in swiftArray  {
    print(item) //输出类型是AnyObject
}

for item in swiftArray as! [String] {
    print(item) //输出类型是String
}

