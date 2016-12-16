//
//  ViewController.swift
//  LaunchPageTest
//
//  Created by Freeman on 2016/11/1.
//  Copyright © 2016年 Freeman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    

    @IBAction func pageController(_ sender: UIPageControl) {
        print("\(sender.currentPage)")
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

