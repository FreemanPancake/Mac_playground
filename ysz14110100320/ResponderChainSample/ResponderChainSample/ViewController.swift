//
//  ViewController.swift
//  ResponderChainSample
//
//  Created by chuna on 16/10/13.
//  Copyright © 2016年 chuna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let v = MyView(frame: self.view.frame)
        self.view.addSubview(v)
        
        let v1 = MySubView1(frame: CGRectMake(0,0,self.view.bounds.size.width,self.view.bounds.height/3))
        v1.backgroundColor = UIColor.greenColor()
        v.addSubview(v1)
        
        let v2 = MySubView2(frame: CGRectMake(self.view.bounds.size.width/2,self.view.bounds.height/5,self.view.bounds.size.width/2,self.view.bounds.height*3/5))
        v2.backgroundColor = UIColor.blueColor()
        v.addSubview(v2)
        
        let v3 = MySubView3(frame: CGRectMake(0,self.view.bounds.height*2/3,self.view.bounds.size.width,self.view.bounds.height/3))
        v3.backgroundColor = UIColor.redColor()
        v.addSubview(v3)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

