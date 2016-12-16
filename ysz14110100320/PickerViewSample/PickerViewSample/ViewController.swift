//
//  ViewController.swift
//  PickerViewSample
//
//  Created by 褚娜 on 16/2/28.
//  Copyright © 2016年 chuna. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var pickerData : NSDictionary!          //保存全部数据
    var pickerProvincesData: NSArray!       //当前的省数据
    var pickerCitiesData : NSArray!         //当前的省下面的市数据
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let plistPath = Bundle.main.path(forResource: "provinces_cities", ofType: "plist")
        //获取属性列表文件中的全部数据
        self.pickerData = NSDictionary(contentsOfFile: plistPath!)
        
        //省份名数据
        self.pickerProvincesData = self.pickerData.allKeys as NSArray!
        
        //默认取出第一个省的所有市的数据
        let seletedProvince = self.pickerProvincesData[0] as! String
        self.pickerCitiesData = self.pickerData[seletedProvince] as! NSArray
        
        //可通过storyboard完成
        self.pickerView.dataSource = self
        self.pickerView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onclick(_ sender: AnyObject) {
        
        let row1 = self.pickerView.selectedRow(inComponent: 0)
        let row2 = self.pickerView.selectedRow(inComponent: 1)
        let selected1 = self.pickerProvincesData[row1] as! String
        let selected2 = self.pickerCitiesData[row2]as! String
        
        let title = String(format: "%@，%@市", selected1,selected2)
        
        self.label.text = title
    }

    //实现协议UIPickerViewDataSource方法
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       	if (component == 0) {
            //省份个数
            return self.pickerProvincesData.count
        }
        else {
            //市的个数
            return self.pickerCitiesData.count
        }
    }

    //实现协议UIPickerViewDelegate方法
    //为选择器中某个拨轮的行提供显示数据
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       	if (component == 0) {
            //选择省份名
            return self.pickerProvincesData[row] as? String
        }
        else {
            //选择市名
            return self.pickerCitiesData[row] as? String
        }
    }
    
    //选中选择器某个拨轮中的某行时调用
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (component == 0) {
            let seletedProvince = self.pickerProvincesData[row] as! String
            self.pickerCitiesData = self.pickerData[seletedProvince] as! NSArray
            self.pickerView.reloadComponent(1)  //更新
        }
    }
}

