// Playground - noun: a place where people can play


func makeArray() -> (String)->[String] {
    
    var ary:[String] = [String]()
    
    func addElement(element:String) -> [String] {
        ary.append(element)
        return ary
    }
    
    return addElement
}

let f1 = makeArray()
print("---f1---")
print(f1("张三"))
print(f1("李四"))
print(f1("王五"))

print("---f2---")
let f2 = makeArray()
print(f2("刘备"))
print(f2("关羽"))
print(f2("张飞"))

