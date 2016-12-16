//
//  MusicListController.swift
//  BDMusic
//
//  Created by Freeman on 2016/12/11.
//  Copyright © 2016年 Freeman. All rights reserved.
//

import UIKit

class MusicListController: UITableViewController {
    
    let musicUrlStrl = "http://tingapi.ting.baidu.com/v1/restserver/ting?format=json&calback=&from=webapp_music&method=baidu.ting.billboard.billList&type=1&size=10&offset=0"
    var musics = NSMutableArray()
    var song = NSMutableArray()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadDataSource()
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
                        musicitem.song_id = (currentMusics as! NSDictionary)["song_id"] as? String
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
        return musics.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let cell : MusicCell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! MusicCell
        
        // Configure the cell...
        let model = musics[indexPath.row] as! MusicItem
        cell.title.text = model.title
        cell.detail.text = model.artist_name!
        
        let imageUrl : URL = URL(string: model.musicPic_sm!)!
        let imageData : Data = try! Data(contentsOf: imageUrl)
        let image = UIImage(data: imageData)
        cell.showPic.image = image
        
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let songs = segue.destination as! MusicPlayController
        
        let index = self.tableView.indexPathForSelectedRow
        let model = musics[index!.row] as! MusicItem
        
        let songStr = "http://music.baidu.com/data/music/links?songIds="
        let songUrl = songStr + model.song_id!
        loadSongSource(songUrl)
        
        let songModel = song[0] as! SongItem
        songs.songId = songModel.songId
        songs.albumName = songModel.albumName
        songs.songPicBig = songModel.songPicBig
        songs.artistname = songModel.artistName
        songs.lrcLink = songModel.lrcLink
        songs.showLink = songModel.showLink
        songs.songname = songModel.songName
    }
    
    //MARK: loadSongSource function
    func loadSongSource(_ songurl : String){
        let url = URL(string: songurl)
        let session = URLSession.shared  //单例
        //创建任务
        let task = session.dataTask(with: url!) { (data, response, error) in
            
            if error != nil{
                print("错误：\(error.debugDescription)")
            }
            
            
            
            
            if data != nil{
                var data1 = data
                if !JSONSerialization.isValidJSONObject(data!){
                    //非UTF-8编码格式的JSON，转编码格式
                    let str = NSString(data: data1!, encoding: String.Encoding.utf8.rawValue)
                    data1 = (str?.data(using: String.Encoding.utf8.rawValue))!
                }
                //反序列化为JSON对象，前题""
                let json = try! JSONSerialization.jsonObject(with: data1!, options: .mutableContainers) as? NSDictionary
                if json != nil{
                    //解析
                    let musicsData = json!["data"] as! NSDictionary
                    let musicsDataSource = musicsData["songList"] as! NSArray
                    let currentDataSource = NSMutableArray()
                    for currentSongs in musicsDataSource {
                        //封装
                        let songitem = SongItem()
                        songitem.songId = (currentSongs as! NSDictionary)["songId"] as? String
                        songitem.songName = (currentSongs as! NSDictionary)["songName"] as? String
                        songitem.artistName = (currentSongs as! NSDictionary)["artistName"] as? String
                        songitem.albumName = (currentSongs as! NSDictionary)["albumName"] as? String
                        songitem.lrcLink = (currentSongs as! NSDictionary)["lrcLink"] as? String
                        songitem.songPicBig = (currentSongs as! NSDictionary)["songPicBig"] as? String
                        songitem.showLink = (currentSongs as! NSDictionary)["showLink"] as? String
                        songitem.songLink = (currentSongs as! NSDictionary)["songLink"] as? String
                        songitem.time = (currentSongs as! NSDictionary)["time"] as? Int
                        songitem.songPicRadio = (currentSongs as! NSDictionary)["songPicRadio"] as? String
                        songitem.size = (currentSongs as! NSDictionary)["size"] as? Int
                        currentDataSource.add(songitem)
                    }
                    self.song = currentDataSource
                }
            }
        }
        task.resume()
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
