// Playground - noun: a place where people can play


enum WeekDays : Int {
    case Monday         = 0
    case Tuesday        = 1
    case Wednesday      = 2
    case Thursday       = 3
    case Friday         = 4
}

//enum WeekDays : Int {
//    case Monday = 0, Tuesday, Wednesday, Thursday, Friday
//}

var day  = WeekDays.Friday
day = WeekDays.Wednesday


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
    
}

let friday = WeekDays.Friday.rawValue

let thursday = WeekDays(rawValue: 3)

if (WeekDays.Friday.rawValue == 4) {
    println("今天是星期五")
}

writeGreeting(day)
writeGreeting(WeekDays.Friday)
