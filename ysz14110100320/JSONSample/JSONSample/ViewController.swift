//
//  ViewController.swift
//  JSONSample
//
//  Created by Freeman on 2016/11/22.
//  Copyright © 2016年 Freeman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //从资源目录获取路径
        let plistPath = Bundle.main.path(forResource: "PersonList", ofType: "json")
        //从文件创建NSData对象
        let data = NSData(contentsOfFile: plistPath!)
        
        let json = try! JSONSerialization.jsonObject(with: data! as Data, options: .mutableContainers) as! NSArray
        for person in json {
            //封装
            let model = Person.personWithArray(dict: person as? NSDictionary)
            print(model?.name)
            print(model?.id)
            print(model?.hobby)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

