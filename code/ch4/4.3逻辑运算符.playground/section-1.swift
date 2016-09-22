// Playground - noun: a place where people can play

var i = 0
var a = 10
var b = 9

if (a > b) || (i++ == 1) {// 换成 | 试一下
    print("或运算为 真")
} else {
    print("或运算为 假")
}

print("i = \(i)")

i = 0;

if (a < b) && (i++ == 1) {// 换成 & 试一下
    print("与运算为 真")
} else {
    print("与运算为 假")
}

print("i = \(i)")
