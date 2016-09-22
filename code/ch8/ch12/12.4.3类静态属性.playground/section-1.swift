// Playground - noun: a place where people can play

class Account {
    
    var amount : Double = 0.0               // 账户金额
    var owner : String = ""                 //账户名
    
    var interestRate : Double = 0.668       //利率
    
    class var staticProp : Double {
    return 0.668 * 1_000_000
    }
    
    var instanceProp : Double {
        return self.interestRate * self.amount
    }
}

//访问静态属性
println(Account.staticProp)


var myAccount = Account()
//访问实例属性
myAccount.amount = 1_000_000
//访问静态属性
println(myAccount.instanceProp)

