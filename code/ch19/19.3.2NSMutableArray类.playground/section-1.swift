// Playground - noun: a place where people can play

import Foundation

var weeksNames : NSMutableArray = NSMutableArray(capacity: 3) //-initWithCapacity:

weeksNames.addObject("星期一")
weeksNames.addObject("星期二")
weeksNames.addObject("星期三")
weeksNames.addObject("星期四")
weeksNames.addObject("星期五")
weeksNames.addObject("星期六")
weeksNames.addObject("星期日")

NSLog("星期名字")
NSLog("====   ====")

for var i = 0; i < weeksNames.count; i++ {
    var obj : AnyObject = weeksNames.objectAtIndex(i)
    var day = obj as! NSString
    NSLog("%i     %@", i, day)
}

for item : AnyObject in weeksNames {
    var day = item as! NSString
    NSLog("%@", day)
}
