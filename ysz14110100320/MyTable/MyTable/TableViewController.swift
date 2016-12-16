//
//  TableViewController.swift
//  MyTable
//
//  Created by Freeman on 2016/11/12.
//  Copyright © 2016年 Freeman. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var tableList:NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        let dataPath = Bundle.main.path(forResource: "Table", ofType: "plist")
        //let dataPath = NSBundle.mainBindle().pathForResoure("Table", ofType: "plist")
        self.tableList = NSArray(contentsOfFile: dataPath!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

     override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tableList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:MyCell = tableView.dequeueReusableCell(withIdentifier: "MyTable") as! MyCell

        // Configure the cell...
        let dict = self.tableList[indexPath.row] as! NSDictionary
        //显示内容
        let t = dict["time"] as? String
        let n = dict["number"] as? String
        let i = dict["islearn"] as? String
        let l = dict["learnnumber"] as? String
        //副标题内容
        cell.time.text = "学习时长："+t!
        cell.number.text = "课程数量："+n!
        cell.islearn.text = "是否学习："+i!
        cell.learnnumber.text = "学习人数："+l!
        //let imageName = dict["image"] as! String
        let imagePath = String(format: "%@.jpg", dict["image"] as! String)
        cell.img.image = UIImage(named: imagePath)
        if cell.img.image==nil{
            print("kong")
        }
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator

        return cell
    }
    
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell:CustomCell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier") as! CustomCell
//        
//        // Configure the cell...
//        
//        let dict:NSDictionary = self.listTeams[indexPath.row] as! NSDictionary
//        cell.myLabel.text = dict["name"] as? String
//        let img = dict["image"] as! String //图标名
//        cell.myImageView.image = UIImage(named: img) //配置图标
//        return cell
//    }


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
