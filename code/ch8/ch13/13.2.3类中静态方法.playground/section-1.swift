// Playground - noun: a place where people can play

class Account {
    
    var owner : String = "Tony"                 //账户名
    
    class func interestBy(amount : Double) -> Double {
        println(self)
        return 0.8886 * amount
    }
}

//调用静态方法
println(Account.interestBy(10_000.00 ))

