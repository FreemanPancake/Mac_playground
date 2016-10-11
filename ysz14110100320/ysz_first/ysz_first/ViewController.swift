//
//  ViewController.swift
//  ysz_first
//
//  Created by Freeman on 16/10/8.
//  Copyright © 2016年 Freeman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //print("视图已经载入\(#function)")
        var rect = CGRectMake(100, 120, 140, 160)
        let v1:UIView = UIView(frame: rect)
        v1.backgroundColor = UIColor.blueColor()//set background_color
        self.view.addSubview(v1)//appear v1
        print(v1.frame)
        print(v1.bounds)
        print(v1.center)
        
        rect.origin.x = 20
        rect.origin.y = 40
        rect.size.width = 60
        rect.size.height = 80
        let v2:UIView = UIView(frame: rect)
        v2.backgroundColor = UIColor.yellowColor()//set background_color
        v1.addSubview(v2)//appear v2
        print(v2.frame)
        print(v2.bounds)
        print(v2.center)
        
        //v1.bounds.size.width = 280
        //v1.bounds.size.height = 320
        
        v1.bounds.origin.x = 100
        v1.bounds.origin.y = 100
        
        print(v1.frame)
        print(v1.bounds)
        print(v1.center)
        
        print(v2.frame)
        print(v2.bounds)
        print(v2.center)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("视图将要出现\(#function)")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("视图已经出现\(#function)")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("视图将要消失\(#function)")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("视图已经消失\(#function)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("低内存警告！\(#function)")
        // Dispose of any resources that can be recreated.
    }


}

