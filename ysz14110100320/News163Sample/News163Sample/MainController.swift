//
//  MainController.swift
//  News163Sample
//
//  Created by Freeman on 2016/11/24.
//  Copyright © 2016年 Freeman. All rights reserved.
//

import UIKit

class MainController: UITableViewController {
    
    let newsUrlStr = "http://c.3g.163.com/nc/article/local/5aSn6L%2Be/0-20.html"
    var news = NSMutableArray()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "大连新闻"
        //加载数据
        loadDataSource()
    }
    
    func loadDataSource(){
        let url = NSURL(string: newsUrlStr)
        let session = URLSession.shared  //单例
        //创建任务
        let task = session.dataTask(with: url! as URL) { (data, response, error) in
            if data != nil{
                if !JSONSerialization.isValidJSONObject(data!){
                //let str = NSString(data: data!, encoding: <#T##UInt#>)
                    //非JSON格式，字符串正则化
                }
                //反序列化为JSON对象，前题""
                let json = try! JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                if json != nil{
                    //解析
                    let newsDataSource = json!["大连"] as! NSArray
                    let currentDataSource = NSMutableArray()
                    for currentNews in newsDataSource {
                        //封装
                        let newsItem = Newsitem()
                        newsItem.newsTitle = (currentNews as! NSDictionary)["title"] as? String
                        newsItem.newsUrl = (currentNews as! NSDictionary)["url"] as? String
                        newsItem.imgSrc = (currentNews as! NSDictionary)["imgsrc"] as? String
                        currentDataSource.add(newsItem)
                    }
                    //回调或者是通知主线程刷新，异步队列
                   DispatchQueue.main.async(execute: { 
                    self.news = currentDataSource
                    self.tableView.reloadData()
                   })
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
        return news.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        let model = news[indexPath.row] as! Newsitem
        cell.textLabel?.text = model.newsTitle
        
        cell.accessoryType = .disclosureIndicator

        return cell
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detail = segue.destination as! WebController
        
        let index = self.tableView.indexPathForSelectedRow
        let model = news[index!.row] as! Newsitem
        
        detail.urlToLoad = model.newsUrl
    }
    

}
