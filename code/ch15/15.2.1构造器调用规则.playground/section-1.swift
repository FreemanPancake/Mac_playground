// Playground - noun: a place where people can play

import Foundation

class Person {
    var name : String
    var age : Int
    
    func description() -> String {
        return "\(name) 年龄是: \(age)"
    }
    //便利构造器
    //无法调用其他类构造器，包括继承来的
    convenience init () {//3->2
        self.init(name: "Tony")
        self.age = 18
    }
    convenience init (name : String) {//2->1
        self.init(name: name, age: 18)
    }
    //指定构造器
    init (name : String, age : Int) {//1
        self.name = name
        self.age  = age
    }
}

class Student : Person {
    var school : String
    init (name : String, age : Int, school : String) {//4->1
        self.school = school
        super.init(name : name, age : age)
    }
    convenience override init (name : String, age : Int) {//5->4
        self.init(name : name, age : age, school : "清华大学")
    }
}

let student = Student()
print("学生: \(student.description())")
