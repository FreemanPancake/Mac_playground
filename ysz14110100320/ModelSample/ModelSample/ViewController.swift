//
//  ViewController.swift
//  ModelSample
//
//  Created by Freeman on 2016/11/15.
//  Copyright © 2016年 Freeman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var txtname: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.regeistComplete(notification:)), name: NSNotification.Name(rawValue: "RegeistCompleteNotification"), object: nil)
        // Do any additional setup after loading the view, typically from a nib.
    }
    //处理通知
    func regeistComplete(notification:Notification){
        let data = notification.userInfo! as Dictionary
        let userName = data["username"] as! String
        self.txtname.text = userName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

