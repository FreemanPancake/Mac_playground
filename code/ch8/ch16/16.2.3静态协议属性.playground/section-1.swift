// Playground - noun: a place where people can play

import UIKit

protocol Account  {
    class var interestRate : Double {get}  //利率
    class func interestBy(amount : Double) -> Double
}

class ClassImp : Account {
    
    class var interestRate : Double  {
    return 0.668
    }
    class func interestBy(amount : Double) -> Double {
        return ClassImp.interestRate * amount
    }
}

struct StructImp : Account {
    
    static var interestRate : Double = 0.668
    static func interestBy(amount : Double) -> Double {
        return  StructImp.interestRate * amount
    }
}

enum EnumImp : Account {
    
    static var interestRate : Double = 0.668
    static func interestBy(amount : Double) -> Double {
        return  EnumImp.interestRate * amount
    }
}
