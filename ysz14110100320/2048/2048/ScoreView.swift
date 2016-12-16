//
//  ScoreView.swift
//  2048
//
//  Created by Freeman on 2016/10/20.
//  Copyright © 2016年 Freeman. All rights reserved.
//

import UIKit

enum ScoreType {
    case common //普通分面板
    case best //最高分面板
}

protocol ScoreViewProtocol {
    func changeScore(value s:Int)
}

class ScoreView: UIView,ScoreViewProtocol {
    var label:UILabel! //显示分数
    var type:String! //区分最高分或普通分面板
    
    var score:Int = 0 {//分数值
        didSet{
            //分数变化，标签内容也要变化
            label.text = "\(type):\(score)"
        }
    }
    
    func changeScore(value s:Int) {
        score = s
    }
    
    init(type:ScoreType) {
        label = UILabel(frame: CGRect(x:0,y:0,width:100,height:30))
        label.textAlignment = NSTextAlignment.center
        super.init(frame: CGRect(x:0,y:0,width:100,height:30))
        self.type = (type == ScoreType.common ? "分数" : "最高分")
        self.backgroundColor = UIColor.orange
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.white
        
        self.addSubview(label)
    }
    
    required init?(coder aDecoder:NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
