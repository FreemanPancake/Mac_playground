// Playground - noun: a place where people can play

var studentList: [String]  = ["张三","李四","王五"]
print(studentList)

studentList.append("董六")
print(studentList)

studentList += ["刘备", "关羽"]
print(studentList)

studentList.insert("张飞",atIndex:studentList.count)
print(studentList)

let removeStudent = studentList.removeAtIndex(0)
print(studentList)

studentList[0] = "诸葛亮"
print(studentList)


var shoppingList = ["芒果", "橘子", "水", "葡萄", "香蕉"];
//声明一个5个字符串类型元素的数组

shoppingList[1] = "哈密瓜"     //修改第一个元素的值
shoppingList[2...4] = ["Bananas","Apples"]
print(shoppingList)
