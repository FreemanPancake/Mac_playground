//
//  RegeisterViewController.swift
//  ModelSample
//
//  Created by Freeman on 2016/11/15.
//  Copyright © 2016年 Freeman. All rights reserved.
//

import UIKit

class RegeisterViewController: UIViewController {

    @IBAction func cancel(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
        let data = ["username": self.name.text]  //bring back to home
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "RegeistCompleteNotification"), object: nil, userInfo: data)
    }
    
    @IBOutlet weak var name: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
