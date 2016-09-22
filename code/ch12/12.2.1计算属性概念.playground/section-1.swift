// Playground - noun: a place where people can play

import UIKit

class Employee {
    var no : Int = 0
    var firstName : String = "Tony"
    var lastName : String = "Guan"
    var job : String?
    var salary : Double = 0
    lazy var dept : Department = Department()
    
    var fullName : String {
        get {
            return firstName + "." + lastName
        }
        
            set (newFullName) {
                var name = newFullName.componentsSeparatedByString(".")
                firstName = name[0]
                lastName = name[1]
            }
        
//        set {
//            var name = newValue.componentsSeparatedByString(".")
//            firstName = name[0]
//            lastName = name[1]
//        }
        
    }
}

struct Department {
    let no : Int = 0
    var name : String = ""
}

var emp = Employee()
print(emp.fullName)

emp.fullName = "Tom.Guan"
print(emp.fullName)
print(emp.firstName)

