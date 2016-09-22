// Playground - noun: a place where people can play

func divide(n1 : Int, n2 : Int) ->Double? {
    if n2 == 0 {
        return nil
    }
    return Double(n1)/Double(n2)
}

let result1 : Double? = divide(100, 200)
println(result1!)

if let result2 : Double = divide(100, 0) {
    println("Success.")
} else {
    println("failure.")
}

let result3 : Double! = divide(100, 200)
println(result3)
