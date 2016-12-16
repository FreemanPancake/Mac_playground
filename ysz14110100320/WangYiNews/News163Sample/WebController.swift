//
//  WebController.swift
//  News163Sample
//
//  Created by Freeman on 2016/11/24.
//  Copyright © 2016年 Freeman. All rights reserved.
//

import UIKit

class WebController: UIViewController {
    
    var urlToLoad:String?
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.urlToLoad != nil {
            let url = URL(string: urlToLoad!)
            let req = NSURLRequest(url: url!)
            self.webView.loadRequest(req as URLRequest)
        }
        // Do any additional setup after loading the view.
    }

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
