// Playground - noun: a place where people can play
let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

for i in 0 ..< numbers.count
{
    if i == 3 {
        continue
    }
    print("Count is:  \(i)")
}
