//
//  TabBarController.swift
//  Final
//
//  Created by Freeman on 2016/12/13.
//  Copyright © 2016年 Freeman. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let story = UIStoryboard(name: "Main", bundle: nil)
        lat home = story.instantiateViewController(withIdentifier: "home") as! HomeViewController
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
