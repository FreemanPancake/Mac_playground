// Playground - noun: a place where people can play

label1: for x in 0 ..< 5 {
    
    label2: for var y = 5; y > 0; y-- {
        if y == x {
            //continue label1
        }
        print("(x,y) = (\(x),\(y))")
    }
}

print("Game Over!")
