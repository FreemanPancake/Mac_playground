//
//  TabBarController.swift
//  News163Sample
//
//  Created by Freeman on 2016/12/4.
//  Copyright © 2016年 Freeman. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    @IBOutlet weak var tb: UITabBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        let story = UIStoryboard(name: "Main", bundle: nil)
        let c1 = story.instantiateViewController(withIdentifier: "NewsList") as! MainController
        c1.tabBarItem.title = "大连新闻"
        c1.tabBarItem.image = UIImage(named: "newslogo.png")
        c1.tabBarItem.badgeValue = "99+"
        // Do any additional setup after loading the view.
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
