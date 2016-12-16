//
//  MainController.swift
//  News163Sample
//
//  Created by Freeman on 2016/11/24.
//  Copyright © 2016年 Freeman. All rights reserved.
//

import UIKit

class MainController: UITableViewController {
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    var timer:Timer!
    
    let newsUrlStr = "http://c.3g.163.com/nc/article/local/5aSn6L%2Be/0-20.html"
    var news = NSMutableArray()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.title = "大连新闻"
        //加载数据
        loadDataSource()
        
        //drop down refesh
        self.refreshControl = UIRefreshControl()
        self.refreshControl?.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        self.refreshControl?.attributedTitle = NSAttributedString(string: "Drag down to Refresh")
        refreshData()
        
        //轮播图
        for i in 1...3{ //loading the images
            let image = UIImage(named: "\(i).jpg")!
            let x = CGFloat(i - 1) * self.view.frame.width
            let imageView = UIImageView(frame: CGRect(x : x, y : 0, width : self.view.frame.width, height : scrollView.bounds.height))
            imageView.image = image
            self.scrollView.isPagingEnabled = true
            self.scrollView.showsHorizontalScrollIndicator = true
            self.scrollView.isScrollEnabled = true
            self.scrollView.addSubview(imageView)
            self.scrollView.delegate = self
        }
        
        self.scrollView.contentSize = CGSize(width : (self.view.frame.width * 3), height : scrollView.frame.height)
        self.pageControl.numberOfPages = 3
        self.pageControl.currentPageIndicatorTintColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.9)
        self.pageControl.pageIndicatorTintColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.5)
        
        addTimer()
        //self.scrollView.addSubview(pageControl)
    }
    func refreshData(){
        loadDataSource()
        self.tableView.reloadData()
        self.refreshControl?.endRefreshing()
    }
    
    func loadDataSource(){
        let url = NSURL(string: newsUrlStr)
        let session = URLSession.shared  //单例
        //创建任务
        let task = session.dataTask(with: url! as URL) { (data, response, error) in
            if data != nil{
                if !JSONSerialization.isValidJSONObject(data!){
                //let str = NSString(data: data!, encoding: UInt)
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
                        newsItem.digest = (currentNews as! NSDictionary)["digest"] as? String
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
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let width = self.view.frame.width
        let offsetX = scrollView.contentOffset.x
        let index = (offsetX + width / 2) / width
        pageControl.currentPage = Int(index)
    }
    
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        removeTimer()
    }
    
    override func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        addTimer()
    }
    
    func addTimer() {
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(CircleController.nextImage), userInfo: nil, repeats: true)
    }
    
    func removeTimer() {
        timer.invalidate()
    }
    
    func nextImage() {
        var pageIndex = pageControl.currentPage
        if pageIndex == 2 {
            pageIndex = 0
        } else {
            pageIndex += 1
        }
        
        let offsetX = CGFloat(pageIndex) * self.view.frame.width
        scrollView.setContentOffset(CGPoint(x : offsetX, y : 0), animated: true)
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
        //let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let cell : NewsCell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! NewsCell

        // Configure the cell...
        let model = news[indexPath.row] as! Newsitem
        cell.newsTitle.text = model.newsTitle
        cell.digest.text = model.digest
        
        let imageUrl : URL = URL(string: model.imgSrc!)!
        let imageData : Data = try! Data(contentsOf: imageUrl)
        let image = UIImage(data: imageData)
        cell.newsImage.image = image
        
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
























