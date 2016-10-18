//
//  ViewController.swift
//  2048
//
//  Created by Freeman on 16/10/18.
//  Copyright © 2016年 Freeman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func tapped(sender: UIButton) {
        let alert = UIAlertController(title: "Start", message: "Are you ready to go?", preferredStyle: .Alert)
        self.presentViewController(alert, animated: true, completion: nil)
        alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Okay", style: .Default, handler: { (action:UIAlertAction) in
            self.presentViewController(MainViewController(), animated: true, completion: nil)
        }))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

