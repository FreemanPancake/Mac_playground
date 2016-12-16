//
//  MainViewController.swift
//  2048
//
//  Created by Freeman on 16/10/18.
//  Copyright © 2016年 Freeman. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var dimension = 4 //纬度
    let WIDTH:CGFloat = 50 //方格宽度
    let PADDING:CGFloat = 6 //方格间距
    
    var commonScore:ScoreView!
    var bestScore:ScoreView!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        setScoreLabels()
        setGameMap()
        setButtons()
        for _ in 0..<2 {
            genNumber()
        }
        
    }
    
    //MARK:产生随机数
    func genNumber(){
        
        //用于确定随机数的概率
        let randv = Int(arc4random_uniform(UInt32(10)))
        var seed:Int = 2 //90%的概率会产生2
        if randv == 1 { //有10%的几率出现1
            seed = 4
        }
        
        //随机生成行号和列号
        let row = Int(arc4random_uniform(UInt32(dimension)))
        let col = Int(arc4random_uniform(UInt32(dimension)))
        
        //插入
    }
    
    //MARK:布局分数面板，初值0
    func setScoreLabels(){
        let x = (self.view.bounds.size.width-CGFloat(dimension)*WIDTH)/2
        
        commonScore = ScoreView(type:ScoreType.common)
        commonScore.frame.origin = CGPoint(x: x,y: 80)
        commonScore.changeScore(value: 0)
        self.view.addSubview(commonScore)
        
        bestScore = ScoreView(type:ScoreType.best)
        bestScore.frame.origin = CGPoint(x: x+120,y: 80)
        bestScore.changeScore(value: 0)
        self.view.addSubview(bestScore)
        
    }
    
    //MARK:游戏地图布局
    func setGameMap(){
        var x = (self.view.bounds.size.width-CGFloat(dimension)*WIDTH)/2
        var y:CGFloat = 150
        for _ in 0..<dimension {
            y = 150
            for _ in 0..<dimension {
                //初始化视图
                let square = UIView(frame: CGRect(x: x,y: y,width: WIDTH,height: WIDTH))
                square.backgroundColor = UIColor.darkGray
                self.view.addSubview(square)
                y+=WIDTH+PADDING
            }
            x+=WIDTH+PADDING
        }
    }
    
    //MARK:游戏按钮布局
    func setButtons(){
        let x:CGFloat = (self.view.bounds.size.width-CGFloat(dimension)*WIDTH)/2
        
        //重置按钮
        let btnReset = UIButton(type: UIButtonType.roundedRect)
        btnReset.frame = CGRect(x: x, y: 450, width: 100, height: 30)
        btnReset.setTitle("Reset", for: UIControlState())
        btnReset.setTitleColor(UIColor.white, for: UIControlState())
        btnReset.backgroundColor = UIColor.orange
        btnReset.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        btnReset.addTarget(self, action: #selector(MainViewController.resetTapped), for: .touchUpInside)
        self.view.addSubview(btnReset)
        
        //新数按钮
        let btnGen = UIButton(type: UIButtonType.roundedRect)
        btnGen.frame = CGRect(x: x+120, y: 450, width: 100, height: 30)
        btnGen.setTitle("NewNumber", for: UIControlState())
        btnGen.setTitleColor(UIColor.white, for: UIControlState())
        btnGen.backgroundColor = UIColor.orange
        btnGen.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        btnGen.addTarget(self, action: #selector(MainViewController.genTapped), for: .touchUpInside)
        self.view.addSubview(btnGen)
    }
    
    func resetTapped(){
        
    }
    
    func genTapped(){
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
