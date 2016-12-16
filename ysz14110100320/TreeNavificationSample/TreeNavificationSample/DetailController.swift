//
//  DetailController.swift
//  TreeNavificationSample
//
//  Created by Freeman on 2016/11/15.
//  Copyright © 2016年 Freeman. All rights reserved.
//

import UIKit

class DetailController: UIViewController,UIWebViewDelegate {

    var urlStr:String!
    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let url = URL(string: urlStr)
        let request = URLRequest(url: url!)
        webView.loadRequest(request)
        webView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        print("加载失败")
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
