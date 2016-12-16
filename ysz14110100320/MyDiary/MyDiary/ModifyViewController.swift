//
//  ModifyViewController.swift
//  MyDiary
//
//  Created by Freeman on 2016/11/19.
//  Copyright © 2016年 Freeman. All rights reserved.
//

import UIKit

class ModifyViewController: UIViewController {
    
    var diary:Diary?

    @IBOutlet weak var modifyField: UITextView!
    
    @IBAction func onSave(_ sender: UIBarButtonItem) {
        //封装数据
        let diaryModel = Diary(date:Date(), content: self.modifyField.text)
        //方法一:利用通知传递数据
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reloadViewNotification"), object: diaryModel, userInfo: nil)
        
        self.modifyField.resignFirstResponder()
        //当前界面撤销
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveAndBack(_ sender: UIButton) {
        //封装数据
        let diaryModel = Diary(date:Date(), content: self.modifyField.text)
        //方法一:利用通知传递数据
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reloadViewNotification"), object: diaryModel, userInfo: nil)
        
        self.modifyField.resignFirstResponder()
        //当前界面撤销
        //self.dismiss(animated: true, completion: nil)
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.diary != nil {
            self.modifyField.text = self.diary!.content
        }
         //Do any additional setup after loading the view.
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
