// Playground - noun: a place where people can play

import UIKit

struct Rectangle {
    
    var width : Double
    var height : Double
    
    init(width : Double, height : Double) {
        self.width   = width
        self.height  = height
    }
    func description() -> String {
        return "Rectangle"
    }
}

extension Rectangle {
    init(length : Double) {
        self.init(width : length, height : length)
    }
}

var rect = Rectangle(width : 320.0, height : 480.0)
print("长方形:\(rect.width) x \(rect.height)")

var square = Rectangle(length: 500.0)
print("正方形:\(square.width) x \(square.height)")

class Person {
    var name : String
    var age : Int
    func description() -> String {
        return "\(name) 年龄是: \(age)"
    }
    init (name : String, age : Int) {
        self.name = name
        self.age  = age
    }
}

extension Person {
    convenience init (name : String) {
        self.init(name : name, age : 8)
    }
}

let p1 = Person(name : "Mary")
print("Person1 : \(p1.description())")
let p2 = Person(name : "Tony", age : 28)
print("Person2 : \(p2.description())")
