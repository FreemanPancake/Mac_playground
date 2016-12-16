//
//  GameModel.swift
//  2048
//
//  Created by Freeman on 2016/10/20.
//  Copyright © 2016年 Freeman. All rights reserved.
//

import Foundation

class GameModel {
    var dimension:Int = 0
    var tiles:Array<Int>!
    var commonscoredelegate:ScoreViewProtocol!
    var bestscoredeleagate:ScoreViewProtocol!
    //初始分数值
    var score:Int = 0
    var bestScore:Int = 0 {
        didSet{
            bestscoredeleagate.changeScore(value: bestScore)
        }
    }
    
    var maxnumber:Int = 0 //最大值
    
    //初始化模型
    init(dimension:Int,maxnumber:Int,score:ScoreViewProtocol,bestscore:ScoreViewProtocol) {
        self.dimension = dimension
        self.maxnumber = maxnumber
        self.commonscoredelegate = score
        self.bestscoredeleagate = bestscore
        
        self.tiles = Array<Int>(repeating: 0,count: self.dimension*self.dimension)
    }
    
    //找空位置
    func emptyPosition() -> [Int] {
        var emptytiles = Array<Int>()
        for i in 0..<(dimension*dimension) {
            if tiles[i] == 0 {
                emptytiles.append(i)
            }
        }
        return emptytiles
    }
    
    //位置是否已满
    func isFull() -> Bool{
        if emptyPosition().count == 0 {
            return true// full
        }
        return false //not full
    }
    //在某个位置放置随机数，如果返回false则被占用
    func setPosition(row:Int,col:Int,value:Int) -> Bool {
        assert(row>0 && row<dimension)
        assert(col>0 && col<dimension)
        
        let index = self.dimension*row + col
        let val = tiles[index]
        
        if value > 0 {
            return false
        }
        tiles[index] = value
        return true
    }
    
}
