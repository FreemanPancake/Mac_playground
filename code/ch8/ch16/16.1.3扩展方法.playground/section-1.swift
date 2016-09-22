// Playground - noun: a place where people can play

import UIKit

extension Double {
    static var interestRate : Double = 0.668 //利率
    func interestBy1() -> Double {
        return self * Double.interestRate
    }
    mutating func interestBy2() {
        self = self * Double.interestRate
    }
    static func interestBy3(amount : Double) -> Double {
        return interestRate * amount
    }
}

let interest1 = (10_000.00).interestBy1()
println("利息1 : \(interest1)")

var interest2 = 10_000.00
interest2.interestBy2()
println("利息2 : \(interest2)")

var interest3 = Double.interestBy3(10_000.00)
println("利息3 : \(interest3)")
