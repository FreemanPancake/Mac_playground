// Playground - noun: a place where people can play

let c1:Int = {(a:Int, b:Int) -> Int in
    return a + b
    }(10,5)

println("10 + 5 = \(c1)")

let c2:Int = {(a:Int, b:Int) -> Int in
    return a - b
    }(10,5)

println("10 - 5 = \(c2)")
