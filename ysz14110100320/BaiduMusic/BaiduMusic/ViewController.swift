//
//  ViewController.swift
//  BaiduMusic
//
//  Created by Freeman on 2016/12/8.
//  Copyright © 2016年 Freeman. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    let musicUrlStrl = "http://tingapi.ting.baidu.com/v1/restserver/ting?format=json&calback=&from=webapp_music&method=baidu.ting.billboard.billList&type=1&size=10&offset=0"
    var musics = NSMutableArray()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "百度音乐"
        loadDataSource()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: loadDataSource function
    func loadDataSource(){
        let url = NSURL(string: musicUrlStrl)
        let session = URLSession.shared  //单例
        //创建任务
        let task = session.dataTask(with: url! as URL) { (data, response, error) in
            if data != nil{
                var data1 = data
                if !JSONSerialization.isValidJSONObject(data!){
                    let str = NSString(data: data1!, encoding: String.Encoding.utf8.rawValue)
                    data1 = (str?.data(using: String.Encoding.utf8.rawValue))!
                    
                    //非JSON格式，字符串正则化
                }
                //反序列化为JSON对象，前题""
                let json = try! JSONSerialization.jsonObject(with: data1!, options: .mutableContainers) as? NSDictionary
                if json != nil{
                    //解析
                    let musicsDataSource = json!["song_list"] as! NSArray
                    let currentDataSource = NSMutableArray()
                    for currentMusics in musicsDataSource {
                        //封装
                        let musicitem = MusicItem()
                        musicitem.title = (currentMusics as! NSDictionary)["title"] as? String
                        musicitem.artist_name = (currentMusics as! NSDictionary)["artist_name"] as? String
                        musicitem.musicPic_sm = (currentMusics as! NSDictionary)["pic_small"] as? String
                        musicitem.musicPic_big = (currentMusics as! NSDictionary)["pic_big"] as? String
                        musicitem.lrclink = (currentMusics as! NSDictionary)["lrclink"] as? String
                        currentDataSource.add(musicitem)
                    }
                    //回调或者是通知主线程刷新，异步队列
                    DispatchQueue.main.async(execute: {
                        self.musics = currentDataSource
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

    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return musics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let cell : MusicListCell = tableView.dequeueReusableCell(withIdentifier: "musicList", for: indexPath) as! MusicListCell
        
        // Configure the cell...
        let model = musics[indexPath.row] as! MusicItem
        cell.title.text = model.title
        cell.detail.text = model.artist_name! + "-" + model.album_title!
        print(model.title!)
        
        let imageUrl : URL = URL(string: model.musicPic_sm!)!
        let imageData : Data = try! Data(contentsOf: imageUrl)
        let image = UIImage(data: imageData)
        cell.musicImage.image = image
        
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }

}

