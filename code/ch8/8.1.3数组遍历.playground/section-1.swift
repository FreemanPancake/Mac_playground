// Playground - noun: a place where people can play

var studentList: [String]  = ["张三","李四","王五"]

for item in studentList {
    print(item)
}
for (index, value) in studentList.enumerate() {//枚举器
    print("Item \(index + 1 ) : \(value)")
}



