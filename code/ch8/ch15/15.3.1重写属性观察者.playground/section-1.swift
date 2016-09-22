// Playground - noun: a place where people can play

import UIKit

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

class Student : Person {
    
    var school : String
    
    override var age : Int {
        willSet {
            println("学生年龄新值：\(newValue)")
        }
        didSet{
            println("学生年龄旧值：\(oldValue)")
        }
    }
    
    convenience init() {
        self.init(name : "Tony", age : 18, school : "清华大学")
    }
    
    init (name : String, age : Int, school : String) {
        self.school = school
        super.init(name : name, age : age)
    }
}

let student1 = Student()
println("学生年龄：\(student1.age)")
student1.age = 6
println("学生年龄：\(student1.age)")
