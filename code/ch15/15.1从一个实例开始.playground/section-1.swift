// Playground - noun: a place where people can play

import UIKit

class Person {
    var name : String = "Daniel"
    var age : Int
    
    func description() -> String {
        return "\(name) 年龄是: \(age)"
    }
    
    init () {
        name = ""
        age  = 1
    }
}

class Student : Person {
    var school : String
    override init () {//重写构造器
        school = ""
        super.init() //向上调用关键字： super
        age  = 8
    }
}

let student = Student()
print("学生: \(student.description())")
