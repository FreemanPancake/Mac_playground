//
//  ViewController.swift
//  TableSample
//
//  Created by Freeman on 2016/11/3.
//  Copyright © 2016年 Freeman. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var table:UITableView!//表视图
    var listTeams:NSArray!//数据源
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //
        let plistPath = Bundle.main.path(forResource: "team", ofType: "plist")
        self.listTeams = NSArray(contentsOfFile: plistPath!)
        
        //实例化表视图
        self.table = UITableView(frame: CGRect(x: 0,y: 20,width: self.view.bounds.size.width,height: self.view.bounds.size.height), style: .plain)
        
        //设置委托
        self.table.dataSource = self
        self.table.delegate = self
        self.view.addSubview(self.table)
        //注册单元格
        self.table.register(UITableViewCell.self, forCellReuseIdentifier: "aCell")
        
        
    }
    
    //MARK:数据源协议UITableViewDataSource
    //返回section的数量，可选择实现，默认返回1
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    //返回section里单元格的数量
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return self.listTeams.count
        if section  == 0 {
            return self.listTeams.count/2
        } else {
            return self.listTeams.count - self.listTeams.count/2
        }
    }
    
    //设置单元格
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "aCell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "aCell")
        }
        
        let row = indexPath.row//行
        let sec = indexPath.section//节
        //let dict = self.listTeams[row] as! NSDictionary
        let dict:NSDictionary
        if sec == 0 {
            dict = self.listTeams[row] as! NSDictionary
        } else {
            dict = self.listTeams[self.listTeams.count/2+row] as! NSDictionary
        }
        let img = dict["image"] as! String//图片名
        
        //配置单元格
        cell?.imageView?.image = UIImage(named: img)//配置图标
        cell?.textLabel?.text = dict["name"] as? String//配置主标题
        
        //扩展图标
        cell?.accessoryType = .disclosureIndicator
        
        return cell!
    }
    
    //返回section头的高度
    private func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> Int? {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
        let dict = self.listTeams[indexPath.row] as! NSDictionary
        let name = dict["name"] as? String
        
        let alert = UIAlertController(title: "提示", message: "你选中了\(name)",preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

