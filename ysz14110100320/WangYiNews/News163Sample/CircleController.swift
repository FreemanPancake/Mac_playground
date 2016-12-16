//
//  CircleController.swift
//  News163Sample
//
//  Created by Freeman on 2016/12/4.
//  Copyright © 2016年 Freeman. All rights reserved.
//

import UIKit

class CircleController: UIViewController,UIScrollViewDelegate {
    
    
    @IBOutlet weak var pc: UIPageControl!
    @IBOutlet weak var sv: UIScrollView!
    var timer:Timer!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "轮播图"
        
        for i in 1...3{ //loading the images
            let image = UIImage(named: "\(i).jpg")!
            let x = CGFloat(i - 1) * self.view.frame.width
            //这一步获取ScrollView的宽度时我用IPHONE6实体机测试是320，右边会出现第二张图片的一部分，最后还是用ROOT VIEW的宽度
            let imageView = UIImageView(frame: CGRect(x : x, y : 0, width: self.view.frame.width, height : sv.bounds.height))
            imageView.image = image
            sv.isPagingEnabled = true
            sv.showsHorizontalScrollIndicator = false
            sv.isScrollEnabled = true
            sv.addSubview(imageView)
            sv.delegate = self
        }
        
        sv.contentSize = CGSize(width : (self.view.frame.width * 3), height : sv.frame.height)
        pc.numberOfPages = 3
//        pc.currentPageIndicatorTintColor = UIColor.red
//        pc.pageIndicatorTintColor = UIColor.white
        addTimer()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let width = self.view.frame.width
        let offsetX = scrollView.contentOffset.x
        let index = (offsetX + width / 2) / width
        pc.currentPage = Int(index)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        removeTimer()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        addTimer()
    }
    
    func addTimer() {
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(CircleController.nextImage), userInfo: nil, repeats: true)
    }
    
    func removeTimer() {
        timer.invalidate()
    }
    
    func nextImage() {
        var pageIndex = pc.currentPage
        if pageIndex == 2 {
            pageIndex = 0
        } else {
            pageIndex += 1
        }
        let offsetX = CGFloat(pageIndex) * self.view.frame.width
        sv.setContentOffset(CGPoint(x : offsetX, y : 0), animated: true)
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
