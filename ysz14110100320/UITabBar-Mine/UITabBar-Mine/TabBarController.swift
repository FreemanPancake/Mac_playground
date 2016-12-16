//
//  TabBarController.swift
//  UITabBar-Mine
//
//  Created by Freeman on 2016/11/22.
//  Copyright © 2016年 Freeman. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    var dictData : NSDictionary!

    override func viewDidLoad() {
        super.viewDidLoad()

        // data ready
        let plistPath = Bundle.main.path(forResource: "provinces_cities", ofType: "plist")
        self.dictData = NSDictionary(contentsOfFile: plistPath!)
        
        //add sub controller
        let story = UIStoryboard(name: "Main", bundle: nil)
        let c1 = story.instantiateViewController(withIdentifier: "Liao") as! LiaoViewController
        c1.listData = self.dictData["辽宁省"] as! NSArray
        c1.view.backgroundColor = UIColor.gray
        c1.tabBarItem.title = "辽宁省"
        //c1.tabBarItem.image =
        c1.tabBarItem.badgeValue = "99+"
        
        let c2 = story.instantiateViewController(withIdentifier: "Hei") as! HeiViewController
        c2.listData = self.dictData["黑龙江省"] as! NSArray
        c2.view.backgroundColor = UIColor.orange
        c2.tabBarItem.title = "黑龙江省"
        
        let c3 = JiViewController()
        c3.listData = self.dictData["吉林省"] as! NSArray
        c3.view.backgroundColor = UIColor.brown
        c3.tabBarItem.title = "吉林省"
        
        self.viewControllers = [c1,c2,c3]
        self.selectedIndex = 1
        self.title = "黑龙江省"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        self.title = item.title
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
