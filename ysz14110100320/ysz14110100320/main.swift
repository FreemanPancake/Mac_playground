//
//  main.swift
//  ysz14110100320
//
//  Created by Freeman on 16/9/22.
//  Copyright © 2016年 Freeman. All rights reserved.
//

import Foundation

//print("Hello, World!")

//1．编写一个程序，要求定义一个字符型变量name，赋值为Dabney，一个浮点型常量tall，赋值为6.208按照如下形式显示输出：
//Dabney，you are 6.208 feet tall.
var name:String = "Dabney"
var tall:Double = 6.208
//print("\(name), you are \(tall) feet tall")
//2．编写程序，已知一周中的工作小时数，然后打印工资总额、税金以及净工资。作如下假设：
//A．基本工资等级=10.00美元/小时
//B．加班（超过40小时）=1.5倍的时间
//C．税率    前300美元为15%
//下一个150美元为20%
//余下的为25%
//不必关心本例是否符合当前税法，要求使用Switch语句实现。
func salary(S salary:Double = 10,H hour:Double) -> (Double, Double){
    var salaries:Double, taxes:Double
    switch salary {
    case 0...40:
        salaries = salary * hour
    default:
        salaries = salary * hour * 1.5
    }
    if salaries > 300 {
        taxes = 45 + (salaries-300) * 0.2
    } else {
        taxes = salaries * 0.15
    }
    return (salaries, taxes)
}

//3．编写程序，求200以内的水仙花数，并输出。
for i in 100...200 {
    var a = i/100;
    var b = (i%10)/10
    var c = i%10
    if (a*a*a)+(b*b*b)+(c*c*c) == i {
        print(i)
    }
}

//4．编写一个函数largeOf，其功能是将两个Double类型变量的数值替换成它们中的较大值，调用该函数，在函数外部进行输出。
func largeOf (A a:Double,B b:Double) -> Double {
    if a>b {
        return a
    } else if b>a {
        return b
    } else {
        return a
    }
}
//5．编写并测试一个函数Fibonacci，在该函数中使用循环完成斐波纳契数列的计算。


func fib(n: Int) -> Int{
    
    if n == 0{
        return 1
    } else if n == 1{
        return 1
    } else {
        return fib(n: n - 1) + fib(n: n - 2)
    }
}
for i in 0...6{
    print(fib(n: i),terminator:" ")
}

//6．编写一个函数，返回一个Int数组中的最大数值，并测试这个函数。
func isMax (A array:[Int] = []) -> Int {
    var m:Int = array[0]
    for i in 0...array.count {
        if m <= array[i]
        {
            m = array[i]
        }
    }
    return m
}

//var A: [Int]  = [4,3,9,6]
//print("the max number is \(isMax(A:A))")

//7．编写一个函数，把两个数组内的相应元素相加，结果返回。并测试这个函数。
func combine (A a:Array<Int>,B b:Array<Int>) -> Array<Int> {
    var c = [Int]()
    for i in 0..<a.count {
        for j in 0..<b.count {
            c.append(a[i] + b[j])
        }
    }
    return c
}

var A : [Int] = [1,3,5,2,8,3]
var B : [Int] = [6,3,9,2,0,4]
print("the result is \(combine(A: A, B: B))")

//8．编写一个程序。按照下列要求：
//第一个属性是社会保障号；第二个属性是一个含有三个成员的结构。它的第一个成员是名，第二个成员是名和姓中间的名字，最后一个是姓。创建并初始化一个含有此类结构的数组。程序按以下形式输出数据：
//Matthew Paige Damon
class S {
    var no : Int
    init(){
        no = 14110100320
    }
    struct name {
        var first_name : String = "Free"
        var mid_name : String = "man"
        var last_name : String = "yu"
    }
}

//9．生成一个Rectangle类，这个类的length和width属性默认为1，其方法计算长方形的perimeter周长和area面积。为该类的length和width设置set和get方法。set方法应验证length和width均为0.0到2.0之间的浮点数。
class Rectangle {
    private var length : Double
    private var width : Double
    
    init(){
        self.length = 1.0
        self.width = 1.0
    }
    
//    func setlength(L l:Double){
//        if l>=0.0 && l<=2.0{
//            self.length = l
//        }
//    }
//    
//    func getlength() -> Double{
//        return self.length
//    }
//    
//    func setwidth(W w:Double){
//        if w>=0.0 && w<=2.0{
//            self.width = w
//        }
//    }
//    
//    func getwidth() -> Double{
//        return self.width
//    }
    
    func perimeter(L l:Double,W w:Double) -> Double {
        return (l+w)*2
    }
    
    func area(L l:Double,W w:Double) -> Double {
        return l*w
    }
    
    var l :Double {
        get {
            return self.length
        }
        set (newl) {
            if newl>=0.0 && newl<=2.0 {
            self.length = newl
            }
        }
    }
    
    var w :Double {
        get {
            return self.width
        }
        set (neww) {
            if neww>=0.0 && neww<=2.0 {
            self.width = neww
            }
        }
    }
}

//var R = Rectangle()
//print(R.l)
//R.w = 1.5
//print(R.w)

//10．编写动物世界中的继承树
//➢   动物类具有身高，体重，颜色等特征，进食，行走等动作
//➢   编写食肉动物和食草动物两个类，继承自动物类，重写父类的方法
//➢   编写老虎，狮子等食肉动物类，找出应该继承的父类，并且重写父类的方法
//➢   编写牛羊等食草动物，找出应该继承的父类，并且重写父类的方法
class Animal
{
    var height : Int
    var weight : Int
    var color : String
    func  eat() -> String {
        return  "动物在进食"
    }
    
    func walk() -> String {
        return "动物在行走"
    }
    
    init(H height:Int,W weight:Int,C color:String) {
        self.color = color
        self.height = height
        self.weight = weight
    }
}

class Meat_animal : Animal
{
    override func eat() -> String {
        print("父类打印\(super.eat())")
        return "父类动物在进食"
    }
    override func walk() -> String {
        print("父类打印\(super.walk())")
        return "父类动物在行走"
    }
}

class Green_animal : Animal
{
    override func eat() -> String {
        print("父类打印\(super.eat())")
        return "父类动物在进食"
    }
    override func walk() -> String {
        print("父类打印\(super.walk())")
        return "父类动物在行走"
    }
}

class Tiger : Meat_animal
{
    override func eat() -> String {
        return "老虎在进食"
    }
    override func walk() -> String {
        return "老虎在行走"
    }
}

class Lion: Meat_animal
{
    override func eat() -> String {
        return "狮子在进食"
    }
    override func walk() -> String {
        return "狮子在行走"
    }
}

class Cow : Green_animal
{
    override func eat() -> String {
        return "牛在进食"
    }
    override func walk() -> String {
        return "牛在行走"
    }
}

class Sheep : Green_animal
{
    override func eat() -> String {
        return "羊在进食"
    }
    override func walk() -> String {
        return "羊在行走"
    }
}



//每个Card对象表示一张扑克牌，添加类的两个属性分别保存该牌的花色与牌值，
//添加一个初始化方法initWithSuite:andCardNumber:对成员变量初始化，
//重写Card类的description方法以获得该牌花色与牌值的字符串表示。

//poker
class Poker {
    var suite:String
    var face:String
    init() {
        self.face = "02"
        self.suite = "S"
    }
    
    var S:String {
        get {
            var s:String
            switch self.suite {
                case "S": s = "黑桃"
                case "H": s = "红心"
                case "D": s = "方块"
                case "C": s = "梅花"
            default: s = "黑桃"
            }
            return s
        }
        set (newS) {
            switch newS {
                case "黑桃": self.suite = "S"
                case "红心": self.suite = "H"
                case "方块": self.suite = "D"
                case "梅花": self.suite = "C"
            default: self.suite = "S"
            }
        }
    }
    
    var F:String {
        get {
            var f:String
            switch self.face {
                case "02":f = "2"
                case "03":f = "3"
                case "04":f = "4"
                case "05":f = "5"
                case "06":f = "6"
                case "07":f = "7"
                case "08":f = "8"
                case "09":f = "9"
                case "10":f = "10"
                case "11":f = "J"
                case "12":f = "Q"
                case "13":f = "K"
                case "14":f = "A"
            default:f = "2"
            }
            return f
        }
        set (newF) {
            switch newF {
                case "2":self.face = "02"
                case "3":self.face = "03"
                case "4":self.face = "04"
                case "5":self.face = "05"
                case "6":self.face = "06"
                case "7":self.face = "07"
                case "8":self.face = "08"
                case "9":self.face = "09"
                case "10":self.face = "10"
                case "J":self.face = "11"
                case "Q":self.face = "12"
                case "K":self.face = "13"
                case "A":self.face = "14"
            default:self.face = "02"
            }
        }
    }
    
    func description () -> String {
        return "\(self.suite)\(self.face)"
    }
}

class Card : Poker{
    override func description() -> String {
        return "花色是：\(self.S),牌面是: \(self.F)"
    }
}

var card = Poker()
print(card.S)
card.S = "方块"
//print(card.S)
//print(card.F)
print(card.description())

var card1 = Card()
print(card1.description())

