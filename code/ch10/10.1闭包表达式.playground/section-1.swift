// Playground - noun: a place where people can play


func calculate(opr :String)-> (Int,Int)-> Int {
    
    var result : (Int,Int)-> Int
    
    switch (opr) {
    case "+" :
        result = {(a:Int, b:Int) -> Int in
            return a + b
        }
    default:
        result = {(a:Int, b:Int) -> Int in
            return a - b
        }
    }
    return result
}

let f1:(Int,Int)-> Int = calculate("+")
print("10 + 5 = \(f1(10,5))")

let f2:(Int,Int)-> Int = calculate("-")
print("10 - 5 = \(f2(10,5))")

