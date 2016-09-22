// Playground - noun: a place where people can play

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
