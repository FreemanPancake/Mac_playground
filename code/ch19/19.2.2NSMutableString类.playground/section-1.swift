// Playground - noun: a place where people can play

import Foundation

var str1 : NSString = "Objective C"
var search, replace : NSString

var mstr : NSMutableString
var substr : NSRange

//从不可变的字符创建可变字符串对象
mstr = NSMutableString(string: str1)
NSLog(" %@", mstr)
//输出： Objective C

//插入字符串
mstr.insertString(" Java", atIndex : 9)
NSLog(" %@", mstr)
//输出： Objective Java C

//具有连接效果的插入字符串
mstr.insertString(" and C++", atIndex : mstr.length)
NSLog(" %@", mstr)
//输出： Objective Java C and C++

//字符串连接方法
mstr.appendString(" and C")
NSLog(" %@", mstr)
//输出： Objective Java C and C++ and C

//使用NSRange删除字符串
mstr.deleteCharactersInRange(NSMakeRange(16, 13))
NSLog(" %@", mstr)
//输出： Objective Java CC

//查找字符串位置
substr = mstr.rangeOfString("string B and")
if substr.location != NSNotFound {
    mstr.deleteCharactersInRange(substr)
    NSLog(" %@", mstr)
}

//直接设置可变字符串
mstr.setString("This is string A ")
NSLog(" %@", mstr)
//输出： This is string A

mstr.replaceCharactersInRange(NSMakeRange(8, 8), withString: "a mutable string ")
NSLog(" %@", mstr)
//输出： This is a mutable string

//查找和替换
search = "This is "
replace = "An example of "

substr = mstr.rangeOfString(search as String)

if substr.location != NSNotFound {
    mstr.replaceCharactersInRange(substr, withString: replace as String)
    NSLog(" %@", mstr)
    //输出： An example of a mutable string
}

//查找和替换所有的情况
search = "a"
replace = "X"
substr = mstr.rangeOfString(search as String)

while substr.location != NSNotFound {
    mstr.replaceCharactersInRange(substr, withString: replace as String)
    substr = mstr.rangeOfString(search as String)
}
NSLog(" %@", mstr)
//输出： An exXmple of X mutXble string

