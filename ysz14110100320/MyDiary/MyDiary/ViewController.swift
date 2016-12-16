//
//  ViewController.swift
//  MyDiary
//
//  Created by Freeman on 2016/11/10.
//  Copyright © 2016年 Freeman. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var searchController : UISearchController!
    
    var diaries = NSMutableArray()
    var filterDiaries = NSMutableArray()
    var diary : Diary?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        //方法一：利用通知传递数据
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.reloadView(notification:)), name: NSNotification.Name(rawValue: "reloadViewNotification"), object: nil)
    }
    
    //MARK:--处理通知
    func reloadView(notification: Notification){
        let diaryModel = notification.object as! Diary
        self.diaries.add(diaryModel)
        self.tableView.reloadData()
    }
    
    //MARK:过滤结果集方法
//    func filterContentForSearchText(_ searchText : NSString, _ scope : Int){
//        if searchText.length == 0 {
//            self.filterDiaries = self.diaries
//            return
//        }
//        var emptyArray : NSArray!
//        if scope == 0 {
//            let scopePredicate = NSPredicate(format: s, argumentArray: <#T##[Any]?#>)
//        }
//    }

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
        return diaries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyDiary", for: indexPath)

        // Configure the cell...
        let b_cell = (indexPath.row == diaries.count)
        
        if b_cell == false{
            let diaryModel = diaries[indexPath.row] as? Diary
            let date = diaryModel?.date
            cell.textLabel?.text = diaryModel?.content
            let dateFormatter: DateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM-dd HH:mm"
            cell.detailTextLabel?.text = dateFormatter.string(from: date!)
        }
        return cell
    }

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            self.diaries.removeObject(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

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

    
    // MARK: - Navigation  方法二：传递模型
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let diaryModel =  diaries[indexPath.row] as! Diary
                let detail = segue.destination as! DetailViewController
                //传递数据给详细视图控制器
                detail.diary = diaryModel
            }
        }
    }

}
