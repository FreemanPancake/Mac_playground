// Playground - noun: a place where people can play


enum WeekDays {
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
}

//enum WeekDays {
//    case Monday, Tuesday, Wednesday, Thursday, Friday
//}

var day  = WeekDays.Friday
day = WeekDays.Wednesday
day = .Monday

func writeGreeting(day : WeekDays) {
    
    switch day {
    case .Monday:
        println("星期一好！")
    case .Tuesday :
        println("星期二好！")
    case .Wednesday :
        println("星期三好！")
    case .Thursday :
        println("星期四好！")
    case .Friday :
        println("星期五好！")
    }
    //    default:
    //        println("星期五好！")
    
}

writeGreeting(day)
writeGreeting(WeekDays.Friday)
