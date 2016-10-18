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

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        setGameMap()
        setButtons()
        
    }
    
    //MARK:游戏地图布局
    func setGameMap(){
        var x = (self.view.bounds.size.width-CGFloat(dimension)*WIDTH)/2
        var y:CGFloat = 150
        for _ in 0..<dimension {
            y = 150
            for _ in 0..<dimension {
                //初始化视图
                let square = UIView(frame: CGRectMake(x,y,WIDTH,WIDTH))
                square.backgroundColor = UIColor.darkGrayColor()
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
        let btnReset = UIButton(type: UIButtonType.RoundedRect)
        btnReset.frame = CGRectMake(x, 450, 100, 30)
        btnReset.setTitle("Reset", forState: .Normal)
        btnReset.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        btnReset.backgroundColor = UIColor.orangeColor()
        btnReset.titleLabel?.font = UIFont.systemFontOfSize(14)
        btnReset.addTarget(self, action: #selector(MainViewController.resetTapped), forControlEvents: .TouchUpInside)
        self.view.addSubview(btnReset)
        
        //新数按钮
        let btnGen = UIButton(type: UIButtonType.RoundedRect)
        btnGen.frame = CGRectMake(x+120, 450, 100, 30)
        btnGen.setTitle("NewNumber", forState: .Normal)
        btnGen.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        btnGen.backgroundColor = UIColor.orangeColor()
        btnGen.titleLabel?.font = UIFont.systemFontOfSize(14)
        btnGen.addTarget(self, action: #selector(MainViewController.genTapped), forControlEvents: .TouchUpInside)
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
