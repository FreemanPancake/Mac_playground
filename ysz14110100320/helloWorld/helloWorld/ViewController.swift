//
//  ViewController.swift
//  helloWorld
//
//  Created by Freeman on 16/10/13.
//  Copyright © 2016年 Freeman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var label:UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var  rect = CGRectMake(50, 100, 200, 40)
        
        self.label = UILabel(frame: rect)
        
        rect.origin.y += label!.frame.size.height + 20
        let button = UIButton(type: UIButtonType.RoundedRect)
        button.frame = rect
        button.setTitle("Button", forState: UIControlState.Normal)
        button.titleLabel?.font = UIFont.boldSystemFontOfSize(20)
        
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        
        button.addTarget(self, action: #selector(ViewController.tapped(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(label!)
        self.view.addSubview(button)
    }
    
    func tapped(sender:UIButton){
        label?.text = "Hello World!"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

