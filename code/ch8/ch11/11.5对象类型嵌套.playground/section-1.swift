// Playground - noun: a place where people can play


class Employee {
    
    var no : Int = 0
    var name : String = ""
    var job : String = ""
    var salary : Double = 0
    var dept : Department = Department()
    
    var day : WeekDays = WeekDays.Friday
    
    struct Department {
        var no : Int = 10
        var name : String = "SALES"
    }
    
    enum WeekDays {
        case Monday
        case Tuesday
        case Wednesday
        case Thursday
        case Friday
        
        struct Day {
            static var message : String = "Today is..."
        }
    }
}


var emp = Employee()

println(emp.dept.name)

println(emp.day)

let friday = Employee.WeekDays.Friday

if emp.day == friday {
    println("相等")
}

println(Employee.WeekDays.Day.message)//引用嵌套静态属性
