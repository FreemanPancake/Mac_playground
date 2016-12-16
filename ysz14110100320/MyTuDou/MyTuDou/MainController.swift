//
//  MainController.swift
//  MyTuDou
//
//  Created by Freeman on 2016/12/1.
//  Copyright © 2016年 Freeman. All rights reserved.
//

import UIKit

class MainController: UITableViewController {

    let videoStr = "http://api.tudou.com/v3/gw?method=album.item.get&appKey=myKey&format=json&albumId=Lqfme5hSolM&pa%20geNo=5&pageSize=100"
    var videos = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "火影忍者"
        
        loadDataSource()
    }
    
    func loadDataSource(){
        let URL = NSURL(string: videoStr)
        let SESSION = URLSession.shared
        let task = SESSION.dataTask(with: URL! as URL) { (data, response, error) in
            if data != nil{
                if !JSONSerialization.isValidJSONObject(data!) {
                    
                }
                let json = try! JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                if json != nil {
                    let multiResult = json!["multiResult"] as! NSDictionary
                    let results = multiResult["results"] as! NSArray
                    let currentDataSource = NSMutableArray()
                    for currentVideos in results{
                        let videoItem = VideoItem()
                        videoItem.title = (currentVideos as! NSDictionary)["subTitle"] as? String
                        videoItem.url = (currentVideos as! NSDictionary)["itemUrl"] as? String
                        videoItem.picUrl = (currentVideos as! NSDictionary)["picUrl"] as? String
                        videoItem.detail = (currentVideos as! NSDictionary)["title"] as? String
                        currentDataSource.add(videoItem)
                    }
                    DispatchQueue.main.async(execute: {
                        self.videos = currentDataSource
                        self.tableView.reloadData()
                    })
                }
            }
        }
        task.resume()
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
        return videos.count
    }

    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let cell:VideoCell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier") as! VideoCell
        
        let model = videos[indexPath.row] as! VideoItem
        //cell.textLabel?.text = model.title
        cell.videoTitle.text = model.title
        
        let imgPath = model.picUrlc
        let picUrl : URL = URL(string: imgPath!)!
        let data : Data = try! Data(contentsOf: picUrl)
        let image = UIImage(data: data)
        cell.videoImage.image = image
        //cell.detailTextLabel?.text = model.detail
            
        cell.accessoryType = .disclosureIndicator
        //cell.accessoryType = .detailDisclosureButton
        

        return cell
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detail = segue.destination as! VideoController
        
        let index = self.tableView.indexPathForSelectedRow
        let model = videos[index!.row] as! VideoItem
        
        detail.url = model.url
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
