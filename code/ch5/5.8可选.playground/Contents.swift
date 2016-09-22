//: Playground - noun: a place where people can play


//可选,optional
var str1 = "200"
var int1:Int = 100
int1 = Int(str1)!

let possibleNumber:Int? = Int(str1)
print(possibleNumber)

let convertedNumber = possibleNumber
print(convertedNumber)

let convertedNumber2 = possibleNumber!
print(convertedNumber2)


var age : Int?
print(age)

age = 22
print(age)
print(age!)  //保证有值的情况下才会这么用，强制拆包（解析）

var num:Int! //隐式可选类型，使用!声明， 表示这个类型永远不会出现nil的情况。

/*在什么情况下才会使用optional类型？
 1.当我们需要声明一个变量，在类中没有进行初始化，就需要声明为可选类型
 
 2.当我们不知道是否会有值的时候，这个变量可以身影为optional，比如传值时。

*/
