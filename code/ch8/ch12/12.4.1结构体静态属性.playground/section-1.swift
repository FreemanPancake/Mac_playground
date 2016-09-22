// Playground - noun: a place where people can play


struct Account {
    
    var amount : Double = 0.0               // 账户金额
    var owner : String = ""                 //账户名
    
    static var interestRate : Double = 0.668 //利率
    
    static var staticProp : Double {
    return interestRate * 1_000_000
    }
    
    var instanceProp : Double {
        return Account.interestRate * amount
    }
}

//访问静态属性
println(Account.staticProp)


var myAccount = Account()
//访问实例属性
myAccount.amount = 1_000_000
//访问静态属性
println(myAccount.instanceProp)

