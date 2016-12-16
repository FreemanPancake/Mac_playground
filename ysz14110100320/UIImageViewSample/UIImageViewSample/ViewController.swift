//
//  ViewController.swift
//  UIImageViewSample
//
//  Created by chuna on 16/10/27.
//  Copyright © 2016年 chuna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createEditableCopyOfDatabaseIfNeeded()
        self.imageView.image = UIImage(named: "SkyDrive340.png")
    
    }

    //从资源目录加载
    @IBAction func loadBundle(sender: AnyObject) {
        let path = NSBundle.mainBundle().pathForResource("SkyDrive340", ofType: "png")
        //print(path)
        self.imageView.image = UIImage(contentsOfFile: path!)
    }
    //从沙箱目录加载
    @IBAction func loadSandBox(sender: UIButton) {
        let path = applicationDocumentsDirectoryFile()
        self.imageView.image = UIImage(contentsOfFile: path)
    }
    
    //从远端服务器加载
    @IBAction func loadWebService(sender: AnyObject) {
        let strUrl = "http://a.hiphotos.baidu.com/baike/c0%3Dbaike80%2C5%2C5%2C80%2C26/sign=907dd0e4e924b899ca31716a0f6f76f0/9a504fc2d56285355d9828c590ef76c6a6ef63de.jpg"
        let url = NSURL(string: strUrl)
        let data = NSData(contentsOfURL: url!)
        self.imageView.image = UIImage(data: data!)
    }
    
    //返回沙箱中document目录下flower.png的路径
    func applicationDocumentsDirectoryFile()->String{
        let documentDirectorys:NSArray = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let docuDir = documentDirectorys[0]
        let path = (docuDir as! NSString).stringByAppendingPathComponent("flower.png")
        return path
    }
    
    //将应用程序资源目录下flower.png拷贝至沙箱的document目录下
    func createEditableCopyOfDatabaseIfNeeded() {
        //文件管理器
        let fileManager = NSFileManager.defaultManager()
        //调用自定义方法，返回图片文件 FILE_NAME 在沙箱中的路径
        let writableDBPath = applicationDocumentsDirectoryFile()
        
        let dbexits =  fileManager.fileExistsAtPath(writableDBPath)  //利用文件管理器判断文件是否存在
        
        if !dbexits {
            //获取图片文件 FILE_NAME 在应用程序包目录中的路径
            let  defaultDBPath = ((NSBundle.mainBundle().resourcePath)! as NSString).stringByAppendingPathComponent("flower.png")
            
            var error: NSError? = nil
            let success: Bool
            
            do {
                //复制
                try fileManager.copyItemAtPath(defaultDBPath, toPath : writableDBPath)
                success = true
            } catch let er as NSError {
                error = er
                success = false
            }
            
            if !success {
                print("错误写入文件:\(error!.localizedDescription)")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

