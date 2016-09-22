// Playground - noun: a place where people can play

func makecoffee(type : String = "卡布奇诺") -> String {
    return "制作一杯\(type)咖啡。"
}

let coffee1 = makecoffee("拿铁")
let coffee2 = makecoffee()

print("\(coffee1)")
print("\(coffee2)")

func CircleArea(R radius: Double = 30, _ pi: Double = 3.14) -> Double {
    let area = radius * radius * pi
    return area
}

print("圆面积：\(CircleArea(R: 50, 3.1415926))")

