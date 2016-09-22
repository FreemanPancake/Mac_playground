// Playground - noun: a place where people can play

func increment(inout value:Double, amount:Double = 1.0) ->() { //省略
    value += amount
}

var value : Double = 10.0

increment(&value)
print(value)

increment(&value, amount:100.0)
print(value)

