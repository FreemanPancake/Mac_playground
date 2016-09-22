// Playground - noun: a place where people can play


var optionalCod: String?
if optionalCod != nil
{
    print("uppercase optionalCod == \(optionalCod!)")
}
    else
{
    print("optionalCod is nil")
}

class Employee {
    let no : Int = 0
    var name : String = ""
    var job : String?
    var salary : Double = 0
    var dept : Department?
}

struct Department {
    let no : Int = 0
    var name : String = ""
}

var emp = Employee()
//emp.no = 100            //编译错误

let dept = Department()
//dept.name = "SALES"          //编译错误

let emp1 = Employee()
emp1.name =  "Tony"
