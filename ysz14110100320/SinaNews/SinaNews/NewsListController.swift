//
//  NewsListController.swift
//  SinaNews
//
//  Created by Freeman on 2016/12/3.
//  Copyright © 2016年 Freeman. All rights reserved.
//

import UIKit

class NewsListController: UITableViewController {
    
    let newsStr = "http://roll.news.sina.com.cn/interface/rollnews_ch_out_interface.php?col=90,91&type=2&num=20"
    let news = NSMutableArray()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "国内新闻"
        loadDataSource()
    }
    
    func loadDataSource(){
        let url = URL(string: newsStr)
        let session = URLSession.shared
        let task = session.dataTask(with: url! ) { (data,response, error) in
            if data != nil {
                var data1 : Data = data!
                if JSONSerialization.isValidJSONObject(data1) {
                    var dataStr = NSString(data: data1, encoding: String.Encoding.utf8.rawValue)
                    dataStr = self.changeJsonStringToTrueJsonString(data: &dataStr!)
                    data1 = (dataStr?.data(using: String.Encoding.utf8.rawValue))!
                }
                let json = try! JSONSerialization.jsonObject(with: data1, options: .mutableContainers) as? NSDictionary
                
                if json != nil {
                }
            }
        }
        task.resume()
    }
    
    //MARK:处理不标准的JSON数据
    func changeJsonStringToTrueJsonString( data : inout NSString) -> NSString {
        print(data)
        data = data.replacingOccurrences(of: "(\\w+)\\s*:([^A-Za-z0-9_])", with: "\"$1\":$2", options: .regularExpression, range: NSMakeRange(0,data.length)) as NSString
        data = data.replacingOccurrences(of: "([:\\[,\\{])'", with: "$1\"", options: .regularExpression, range: NSMakeRange(0,data.length)) as NSString
        data = data.replacingOccurrences(of: "'([:\\],\\}])", with: "\"$1", options: .regularExpression, range: NSMakeRange(0,data.length)) as NSString
        data = data.replacingOccurrences(of: "([:\\[,\\{])(\\w+)\\s*:", with: "$1\"$2\":", options: .regularExpression, range: NSMakeRange(0,data.length)) as NSString
        
        return data
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
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
