// Playground - noun: a place where people can play

func divide(n1 : Int, n2 : Int) ->Double? {
    if n2 == 0 {
        return nil
    }
    return Double(n1)/Double(n2)
}

let result1 : Double? = divide(100, n2: 200)
print(result1!)

if let result2 : Double = divide(100, n2: 0) {
    print("Success.")
} else {
    print("failure.")
}

let result3 : Double! = divide(100, n2:200)
print(result3)
