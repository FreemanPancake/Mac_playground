// Playground - noun: a place where people can play

import Foundation

class Person {
    
    var name : String
    var age : Int
    
    func description() -> String {
        return "\(name) 年龄是: \(age)"
    }
    
    class func printlnClass() ->() {
        println( "Person 打印...")
    }
    
    init (name : String, age : Int) {
        self.name = name
        self.age  = age
    }
}

class Student : Person {
    
    var school : String
    
    convenience init() {
        self.init(name : "Tony", age : 18, school : "清华大学")
    }
    
    init (name : String, age : Int, school : String) {
        self.school = school
        super.init(name : name, age : age)
    }
    
    override func description() -> String {
        println("父类打印 \(super.description())")
        return "\(name) 年龄是: \(age), 所在学校: \(school)。"
    }
    
    override class func printlnClass() ->() {
        println( "Student 打印...")
    }
}

let student1 = Student()
println("学生1：\(student1.description())")

let student2 : Person = Student()
println("学生2：\(student2.description())")

let student3 : Student = Student()
println("学生3：\(student3.description())")

Person.printlnClass()
Student.printlnClass()
