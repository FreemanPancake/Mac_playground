//
//  DetailViewController.swift
//  MyDiary
//
//  Created by Freeman on 2016/11/17.
//  Copyright © 2016年 Freeman. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var diary:Diary?
    
    @IBOutlet weak var detailDescriprionLabel: UILabel!
    
    @IBAction func modify(_ sender: UIButton) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.detailDescriprionLabel.numberOfLines = 0
        if self.diary != nil {
            self.detailDescriprionLabel.text = self.diary!.content
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "modify" {
                let modifyDiary =  self.diary
                let modify = segue.destination as! ModifyViewController
                //传递数据给修改视图控制器
                modify.diary = modifyDiary
        }
    }
}
