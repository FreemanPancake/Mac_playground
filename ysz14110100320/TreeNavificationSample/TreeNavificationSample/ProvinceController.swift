//
//  ProvinceController.swift
//  TreeNavificationSample
//
//  Created by Freeman on 2016/11/15.
//  Copyright © 2016年 Freeman. All rights reserved.
//

import UIKit

class ProvinceController: UITableViewController {
    
    var plistData:NSDictionary!
    
    var province:NSArray!

    override func viewDidLoad() {
        super.viewDidLoad()

        let plistPath = Bundle.main.path(forResource: "provinces_cities", ofType: "plist")
        self.plistData = NSDictionary(contentsOfFile: plistPath!)
        self.province = self.plistData.allKeys as NSArray
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
        return self.province.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = self.province[indexPath.row] as? String

        return cell
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let index  = self.tableView.indexPathForSelectedRow
        let prov  = self.province[index!.row] as! String
        
        let destination = segue.destination as! CityController
        destination.cities = self.plistData[prov] as! NSArray
        destination.title = prov
    }
    

}
