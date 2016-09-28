
// Playground - noun: a place where people can play

func position(dt: Double, speed:(x:Int, y:Int)) -> (x:Int, y:Int) {
    
    let posx:Int = speed.x * Int(dt)
    let posy:Int = speed.y * Int(dt)
    
    return (posx, posy)
    
}

let move = position(60.0, speed: (10, -5))
print("物体位移：\(move.x) , \(move.y)")
