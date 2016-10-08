// Playground - noun: a place where people can play

/*
下标可以多个，通过行參列表和下标定义
 与实例方法不同的是，下标可以设定为只读或读写
 newValue类型必须和下标定义的返回值类型一致
 只读下标，可以省略get
 通过下标赋值自动调用set；
 通过下标获取自动调用get；
 */

struct DoubleDimensionalArray {
    
    let rows: Int, columns: Int
    var grid: [Int]
    
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(count: rows * columns, repeatedValue: 0)
    }
    
    subscript(row: Int, col: Int) -> Int {
        
        get {
            return grid[(row * columns) + col]
        }
        
        set (newValue1){
            grid[(row * columns) + col] = newValue1
        }
    }
    
}

let COL_NUM = 10
let ROW_NUM = 10

var ary2 = DoubleDimensionalArray(rows: ROW_NUM, columns: COL_NUM)

for var i = 0; i < ROW_NUM; i++ {
    for var j = 0; j < COL_NUM; j++ {
        ary2[i,j] = i * j
    }
}

for var i = 0; i < ROW_NUM; i++ {
    for var j = 0; j < COL_NUM; j++ {
        print("\t \(ary2[i,j])")
    }
    print("\n")
}
