//
//  main.swift
//  ysz14110100320
//
//  Created by Freeman on 16/9/22.
//  Copyright © 2016年 Freeman. All rights reserved.
//

import Foundation

print("Hello, World!")

//1．编写一个程序，要求定义一个字符型变量name，赋值为Dabney，一个浮点型常量tall，赋值为6.208按照如下形式显示输出：
//Dabney，you are 6.208 feet tall.
var name:String = "Dabney"
var tall:Double = 6.208
print("\(name), you are \(tall) feet tall")
//2．编写程序，已知一周中的工作小时数，然后打印工资总额、税金以及净工资。作如下假设：
//A．基本工资等级=10.00美元/小时
//B．加班（超过40小时）=1.5倍的时间
//C．税率    前300美元为15%
//下一个150美元为20%
//余下的为25%
//不必关心本例是否符合当前税法，要求使用Switch语句实现。
func salary(S salary:Double = 10,H hour:Double) -> (Double, Double){
    var salaries:Double, taxes:Double
    switch salary {
    case 0...40:
        salaries = salary * hour
    default:
        salaries = salary * hour * 1.5
    }
    if salaries > 300 {
        taxes = 45 + (salaries-300) * 0.2
    } else {
        taxes = salaries * 0.15
    }
    return (salaries, taxes)
}
//3．编写程序，求200以内的水仙花数，并输出。
for i in 100...200 {
    var a = i/100;
    var b = (i%10)/10
    var c = i%10
    if (a*a*a)+(b*b*b)+(c*c*c) == i {
        print(i)
    }
}
//4．编写一个函数largeOf，其功能是将两个Double类型变量的数值替换成它们中的较大值，调用该函数，在函数外部进行输出。
func largeOf (A a:Double,B b:Double) -> Double {
    if a>b {
        return a
    } else if b>a {
        return b
    } else {
        return a
    }
}
//5．编写并测试一个函数Fibonacci，在该函数中使用循环完成斐波纳契数列的计算。


//6．编写一个函数，返回一个Int数组中的最大数值，并测试这个函数。
func isMax (A a:Array<Int> ) -> Int {
    var m:Int = a[0]
    for i in 0...a.count {
        if m > a[i] {
            return m
        } else {
            m = a[i]
        }
    }
    return m
}


//var A: [Int]  = [4,3,9,6]
//print("the max number is",isMax(A:A))

//7．编写一个函数，把两个数组内的相应元素相加，结果返回。并测试这个函数。
func combine (A a:Array<Int>,B b:Array<Int>) -> Array<Int> {
    var c = [Int]()
    
}

//8．编写一个程序。按照下列要求：
//第一个属性是社会保障号；第二个属性是一个含有三个成员的结构。它的第一个成员是名，第二个成员是名和姓中间的名字，最后一个是姓。创建并初始化一个含有此类结构的数组。程序按以下形式输出数据：
//Matthew Paige Damon
//9．生成一个Rectangle类，这个类的length和width属性默认为1，其方法计算长方形的perimeter周长和area面积。为该类的length和width设置set和get方法。set方法应验证length和width均为0.0到2.0之间的浮点数。
//10．编写动物世界中的继承树
//➢   动物类具有身高，体重，颜色等特征，进食，行走等动作
//➢   编写食肉动物和食草动物两个类，继承自动物类，重写父类的方法
//➢   编写老虎，狮子等食肉动物类，找出应该继承的父类，并且重写父类的方法
//➢   编写牛羊等食草动物，找出应该继承的父类，并且重写父类的方法


