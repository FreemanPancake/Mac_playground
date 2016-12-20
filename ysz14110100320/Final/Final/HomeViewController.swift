//
//  HomeViewController.swift
//  Final
//
//  Created by Freeman on 2016/12/13.
//  Copyright © 2016年 Freeman. All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController {
    
    var tellies = NSMutableArray()
    var movies = NSMutableArray()

    override func viewDidLoad() {
        super.viewDidLoad()
        //get jsondata filepath.
        let jsonPath = Bundle.main.path(forResource: "data", ofType: "json")
        //create Data object
        let url = URL(fileURLWithPath: jsonPath!, isDirectory: false)
        var data = try! Data(contentsOf: url)//NSData(contentsOfFile: jsonPath!)
        var jsonDic = NSDictionary()
        
        if !JSONSerialization.isValidJSONObject(data) {
            var str = NSString(data: data, encoding: String.Encoding.ascii.rawValue)
            let data1 = changeJsonStringToTrueJsonString(data: &str!)
            data = data1.data(using: String.Encoding.ascii.rawValue)!
           print("No")
            //return
        }
        
        jsonDic = try! JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! NSDictionary
        dataLoad(jsonDic)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func changeJsonStringToTrueJsonString( data : inout NSString) -> NSString {
        data = data.replacingOccurrences(of: "(\\w+)\\s*:([^A-Za-z0-9_])", with: "\"$1\":$2", options: .regularExpression, range: NSMakeRange(0,data.length)) as NSString
        data = data.replacingOccurrences(of: "([:\\[,\\{])'", with: "$1\"", options: .regularExpression, range: NSMakeRange(0,data.length)) as NSString
        data = data.replacingOccurrences(of: "'([:\\],\\}])", with: "\"$1", options: .regularExpression, range: NSMakeRange(0,data.length)) as NSString
        data = data.replacingOccurrences(of: "([:\\[,\\{])(\\w+)\\s*:", with: "$1\"$2\":", options: .regularExpression, range: NSMakeRange(0,data.length)) as NSString
        
        return data
    }
    
    func dataLoad(_ jsonData : NSDictionary){
        let tellyDataSource = jsonData["telly_lists"] as! NSArray
        let movieDataSource = jsonData["movie_lists"] as! NSArray
        let telCurrentData = NSMutableArray()
        let movCurrentData = NSMutableArray()
        for currentTellies in tellyDataSource {
            let tellyitem = TellyItem()
            tellyitem.title = (currentTellies as! NSDictionary)["title"] as? String
            tellyitem.bgPic = (currentTellies as! NSDictionary)["bg_pic"] as? String
            tellyitem.detail = (currentTellies as! NSDictionary)["deatil"] as? String
            telCurrentData.add(tellyitem)
        }
        for currentMovies in movieDataSource {
            let movieitem = MovieItem()
            movieitem.title = (currentMovies as! NSDictionary)["title"] as? String
            movieitem.bgPic = (currentMovies as! NSDictionary)["bg_pic"] as? String
            movieitem.detail = (currentMovies as! NSDictionary)["detail"] as? String
            movCurrentData.add(movieitem)
        }
        DispatchQueue.main.async(execute: {
        self.tellies = telCurrentData
        self.movies = movCurrentData
        self.tableView.reloadData()
        })
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //let count = tellies.count + movies.count
        return tellies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let cell : ListViewCell = tableView.dequeueReusableCell(withIdentifier: "homelistcel", for: indexPath) as! ListViewCell

        // Configure the cell
        let tellymodel = tellies[indexPath.row] as! TellyItem
        cell.titleLabel.text = tellymodel.title
        
        //Configure the background
        let bgImageUrl : URL = URL(string: tellymodel.bgPic!)!
        let bgData : Data = try! Data(contentsOf: bgImageUrl)
        let background = UIImage(data: bgData)
        cell.bgImage.image = background
        
        //BlurEffect
        let blurEffect = UIBlurEffect(style: .dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = cell.bgImage.bounds
        cell.bgImage.addSubview(blurView)
        
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
