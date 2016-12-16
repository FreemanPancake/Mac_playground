//
//  ViewController.swift
//  2048
//
//  Created by Freeman on 16/10/18.
//  Copyright © 2016年 Freeman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func tapped(_ sender: UIButton) {
        let alert = UIAlertController(title: "Start", message: "Are you ready to go?", preferredStyle: .alert)
        //self.present(alert, animated: true, completion: nil)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: { (action:UIAlertAction) in
            self.present(MainViewController(), animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

