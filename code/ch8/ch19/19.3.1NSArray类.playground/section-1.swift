// Playground - noun: a place where people can play

import Foundation

let weeksArray = ["星期一","星期二", "星期三", "星期四", "星期五", "星期六","星期日"]

var weeksNames:NSArray = NSArray(array: weeksArray)

NSLog("星期名字")
NSLog("====   ====")

for var i = 0; i < weeksNames.count; i++ {
    var obj : AnyObject = weeksNames.objectAtIndex(i)
    var day = obj as NSString
    NSLog("%i     %@", i, day)
}

for item : AnyObject in weeksNames {
    var day = item as NSString
    NSLog("%@", day)
}
