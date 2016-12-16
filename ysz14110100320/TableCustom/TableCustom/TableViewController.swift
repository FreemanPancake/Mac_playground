//
//  TableViewController.swift
//  TableCustom
//
//  Created by Freeman on 2016/11/8.
//  Copyright © 2016年 Freeman. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var listTeams:NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //资源目录下team.plist文件的路径，可选字符串类型
        let plistPath = Bundle.main.path(forResource: "team", ofType: "plist")
        //获取该文件中的全部数据
        self.listTeams = NSArray(contentsOfFile: plistPath!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listTeams.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:CustomCell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier") as! CustomCell
        
        // Configure the cell...
        
        let dict:NSDictionary = self.listTeams[indexPath.row] as! NSDictionary
        cell.myLabel.text = dict["name"] as? String
        let img = dict["image"] as! String //图标名
        cell.myImageView.image = UIImage(named: img) //配置图标
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
