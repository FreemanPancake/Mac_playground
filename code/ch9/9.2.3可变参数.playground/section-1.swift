// Playground - noun: a place where people can play

func sum(numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total
}

sum(100.0, 20, 30)

sum(30, 80)
