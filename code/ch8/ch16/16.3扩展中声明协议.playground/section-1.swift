// Playground - noun: a place where people can play

import UIKit

protocol Editable  {
    mutating func edit()
}

struct Account {
    var amount : Double = 10.0               	//账户金额
    var owner : String = ""                 	//账户名
}

extension Account : Editable {
    mutating func edit() {
        self.amount *= 100
        self.owner = "Tony"
    }
}

var account  = Account()
account.edit()
println("\(account.owner) - \(account.amount)")
