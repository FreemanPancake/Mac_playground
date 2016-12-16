//
//  TileView.swift
//  2048
//
//  Created by Freeman on 2016/10/20.
//  Copyright © 2016年 Freeman. All rights reserved.
//

import UIKit

class TileView: UIView {
    
    let colorMap = [

        2:UIColor.red,
        4:UIColor.orange,
        8:UIColor.yellow,
        16:UIColor.green,
        32:UIColor.brown,
        64:UIColor.blue,
        128:UIColor.purple,
        256:UIColor.cyan,
        512:UIColor.lightGray,
        1024:UIColor.magenta,
        2048:UIColor.black
    ]
    
    var numberLabel:UILabel!
    var value:Int = 0 {
        didSet{
            self.backgroundColor = colorMap[value]
            numberLabel.text = "\(value)"
        }
    }
    
    init(pos:CGPoint,wid:CGFloat,value:Int) {
        numberLabel = UILabel(frame: CGRect(x:0,y:0,width:wid,height:wid))
        numberLabel.textColor = UIColor.white
        numberLabel.textAlignment = NSTextAlignment.center
        numberLabel.font = UIFont.systemFont(ofSize: 20)
        numberLabel.text = "\(value)"
        super.init(frame:CGRect(x: pos.x, y: pos.y, width: wid, height: wid))
        self.addSubview(numberLabel)
        self.value = value
        self.backgroundColor = colorMap[value]
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
