// Playground - noun: a place where people can play

import UIKit

protocol Account  {
    class func interestBy(amount : Double) -> Double
}

class ClassImp : Account {
    class func interestBy(amount : Double) -> Double {
        return 0.668 * amount
    }
}

struct StructImp : Account {
    static func interestBy(amount : Double) -> Double {
        return 0.668 * amount
    }
}

enum EnumImp : Account {
    static func interestBy(amount : Double) -> Double {
        return 0.668 * amount
    }
}
