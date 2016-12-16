//
//  ViewController.swift
//  DeleteAddCell
//
//  Created by Freeman on 2016/11/8.
//  Copyright © 2016年 Freeman. All rights reserved.
//

import UIKit

class ViewController: UITableViewController,UITextFieldDelegate {
    
    var listTeams:Array<String>!  //NSMutableArray
    
    var textfield:UITextField!  //接受输入

    override func viewDidLoad() {
        super.viewDidLoad()
        
        listTeams = ["辽宁","吉林","黑龙江"]

        self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.navigationItem.title = "删除插入单元格"
        
        self.textfield = UITextField(frame: CGRect(x: 10, y: 5, width: 250, height: 30))
        self.textfield.isHidden = true
        self.textfield.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.textfield.resignFirstResponder()
        self.textfield.text = ""
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //UIViewController生命周期的方法,响应视图编辑状态
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        self.tableView.setEditing(editing, animated: animated)
        if editing {
            self.textfield.isHidden = false
        } else {
            self.textfield.isHidden = true
        }
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.listTeams.count+1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "aCell", for: indexPath)
        // Configure the cell...
        let b_cell = (indexPath.row == listTeams.count)
        
        if b_cell == false {
            cell.textLabel?.text = listTeams[indexPath.row]
        } else {
            //输入文本框
            self.textfield.borderStyle = .line
            self.textfield.placeholder = "Add..."
            cell.contentView.addSubview(self.textfield)
        }

        return cell
    }
    
    //返回删除确认按钮的标题
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "确认删除?"
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        if indexPath.row == self.listTeams.count {
            return .insert
        } else {
            return .delete
        }
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            self.listTeams.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            self.listTeams.append(self.textfield.text!)
            self.tableView.insertRows(at: [indexPath], with: .fade)
        }
        //self.tableView.reloadData() //refresh table
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
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
