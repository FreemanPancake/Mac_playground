// Playground - noun: a place where people can play


class Employee {
    var no : Int = 0
    var name : String = ""
    var job : String?
    var salary : Double = 0
    var dept : Department?
}

class Department {
    var no : Int = 0
    var name : String = ""
    
    var employees : [Employee] = [Employee]()
    
    func insertWithObject(anObject : AnyObject , atIndex index : Int)->() {
        
        let emp = anObject as! Employee
        employees.insert(emp, atIndex:index)
        
    }
}

var dept = Department()

var emp1 = Employee()
dept.insertWithObject(emp1, atIndex: 0)

var emp2 = Employee()
dept.insertWithObject(emp2, atIndex: 0)

var emp3 = Employee()
dept.insertWithObject(emp3, atIndex: 0)

print(dept.employees.count)
