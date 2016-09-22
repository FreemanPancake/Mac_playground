// Playground - noun: a place where people can play


struct Account {
    
    var owner : String = "Tony"                 //账户名
    static var interestRate : Double = 0.668    //利率
    
    static func interestBy(amount : Double) -> Double {
        return interestRate * amount
    }
    
    func messageWith(amount : Double) -> String {
        
        var interest = Account.interestBy(amount)
        return "\(self.owner) 的利息是\(interest)"
        
    }
}

//调用静态方法
println(Account.interestBy(10_000.00))

var myAccount = Account()
//调用实例方法
println(myAccount.messageWith(10_000.00))
