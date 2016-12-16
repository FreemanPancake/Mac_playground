//
//  MusicPlayController.swift
//  BDMusic
//
//  Created by Freeman on 2016/12/11.
//  Copyright © 2016年 Freeman. All rights reserved.
//

import UIKit
import AVFoundation

class MusicPlayController: UIViewController,AVAudioPlayerDelegate {
    
    var player : AVAudioPlayer!
    
    
    var songId : String?
    var songname : String?
    var artistname : String?
    var albumName : String?
    var lrcLink : String?
    var songPicBig : String?
    var showLink : String?
    var songLink : String?
    var time : Int?
    var songPicRadio : String?
    var size : Int?
    
//    let songStr = "http://music.baidu.com/data/music/links?songIds="
//    var song = NSMutableArray()
    
    @IBOutlet weak var songName: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var musicTitle: UILabel!
    @IBOutlet weak var albumPic: UIImageView!
    
    @IBOutlet weak var playBtn: UIButton!
    
    @IBAction func play(_ sender: Any) {
    }
    
    @IBAction func preSong(_ sender: Any) {
        
    }
    
    @IBAction func nextSong(_ sender: Any) {
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let songUrl = songStr + song_id!
//        loadDataSource(songUrl)
//        
//        let model = song[0] as! SongItem
        self.songName.text = self.songname
        self.artistName.text = self.artistname
        self.musicTitle.text = self.songname
        
        let imageUrl : URL = URL(string: self.songPicBig!)!
        let imageData : Data = try! Data(contentsOf: imageUrl)
        let image = UIImage(data: imageData)
        self.albumPic.image = image
        self.albumPic.layer.cornerRadius = self.albumPic.frame.width/2
    }
    
    //MARK: loadDataSource function
//    func loadDataSource(_ songurl : String){
//        let url = URL(string: songurl)
//        let session = URLSession.shared  //单例
//        //创建任务
//        let task = session.dataTask(with: url!) { (data, response, error) in
//            if data != nil{
//                var data1 = data
//                if !JSONSerialization.isValidJSONObject(data!){
//                    let str = NSString(data: data1!, encoding: String.Encoding.utf8.rawValue)
//                    data1 = (str?.data(using: String.Encoding.utf8.rawValue))!
//                    
//                    //非JSON格式，字符串正则化
//                }
//                //反序列化为JSON对象，前题""
//                let json = try! JSONSerialization.jsonObject(with: data1!, options: .mutableContainers) as? NSDictionary
//                if json != nil{
//                    //解析
//                    let musicsData = json!["data"] as! NSDictionary
//                    let musicsDataSource = musicsData["songList"] as! NSArray
//                    let currentDataSource = NSMutableArray()
//                    for currentSongs in musicsDataSource {
//                        //封装
//                        let songitem = SongItem()
//                        songitem.songId = (currentSongs as! NSDictionary)["songId"] as? String
//                        songitem.songName = (currentSongs as! NSDictionary)["songName"] as? String
//                        songitem.artistName = (currentSongs as! NSDictionary)["artistName"] as? String
//                        songitem.albumName = (currentSongs as! NSDictionary)["albumName"] as? String
//                        songitem.lrcLink = (currentSongs as! NSDictionary)["lrcLink"] as? String
//                        songitem.songPicBig = (currentSongs as! NSDictionary)["songPicBig"] as? String
//                        songitem.showLink = (currentSongs as! NSDictionary)["showLink"] as? String
//                        songitem.songLink = (currentSongs as! NSDictionary)["songLink"] as? String
//                        songitem.time = (currentSongs as! NSDictionary)["time"] as? Int
//                        songitem.songPicRadio = (currentSongs as! NSDictionary)["songPicRadio"] as? String
//                        songitem.size = (currentSongs as! NSDictionary)["size"] as? Int
//                        currentDataSource.add(songitem)
//                         //print(currentDataSource)
//                    }
//                    
//                    self.song = currentDataSource
//                    //回调或者是通知主线程刷新，异步队列
////                    DispatchQueue.main.async(execute: {
////                        self.song = currentDataSource
////                        //self.view.reloadInputViews()
////                    })
//                }
//            }
//        }
//        task.resume()
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
