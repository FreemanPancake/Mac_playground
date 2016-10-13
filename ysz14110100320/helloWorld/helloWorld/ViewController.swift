//
//  ViewController.swift
//  helloWorld
//
//  Created by Freeman on 16/10/13.
//  Copyright © 2016年 Freeman. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var label:UILabel?
    var textField:UITextField?
    
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
        
        rect.origin.y += button.frame.size.height + 20
        self.textField = UITextField(frame: rect)
        textField?.borderStyle = UITextBorderStyle.RoundedRect
        textField?.placeholder = "please input"
        textField?.clearButtonMode = UITextFieldViewMode.Always
        
        textField?.delegate = self //delegation委托
        
        self.view.addSubview(textField!)
        
    }
    
    func tapped(sender:UIButton){
        //label?.text = "Hello World!"
        label?.text = textField?.text
    }
    
    //MARK:UITextFieldDelegate协议中的方法
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //注册键盘出现通知
        NSNotificationCenter.defaultCenter().addObserver(self,selector:#selector(ViewController.keyboradDidShow(_:)), name: UIKeyboardDidShowNotification, object: nil)
        
        //注册键盘隐藏通知
        NSNotificationCenter.defaultCenter().addObserver(self,selector:#selector(ViewController.keyboradDidHide(_:)), name: UIKeyboardDidHideNotification, object: nil)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillAppear(animated)
        //解除键盘出现通知
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardDidShowNotification, object: nil)
        //解除键盘隐藏通知
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardDidHideNotification, object: nil)
    }
    
    func keyboradDidShow (notification:NSNotification){
        print("键盘已打开")
    }
    
    func keyboradDidHide (notification:NSNotification){
        print("键盘已关闭")
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

