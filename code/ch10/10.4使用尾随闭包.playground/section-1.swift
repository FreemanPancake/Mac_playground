// Playground - noun: a place where people can play

func calculate(opr:String, funN:(Int,Int)-> Int) {
    
    switch (opr) {
    case "+" :
        print("10 + 5 = \(funN(10,5))")
    default:
        print("10 - 5 = \(funN(10,5))")
    }
}

calculate("+", funN: {(a:Int, b:Int) -> Int in return a + b })
calculate("-"){(a:Int, b:Int) -> Int in return a - b }

