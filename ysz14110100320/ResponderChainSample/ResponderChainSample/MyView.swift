//
//  MyView.swift
//  ResponderChainSample
//
//  Created by chuna on 16/10/13.
//  Copyright © 2016年 chuna. All rights reserved.
//

import UIKit

class MyView: UIView {

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        print("\((#file as NSString).lastPathComponent)+\(#function)")
    }
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?){
        print("\((#file as NSString).lastPathComponent)+\(#function)")
    }
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?){
        print("\((#file as NSString).lastPathComponent)+\(#function)")
    }
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?){
        print("\((#file as NSString).lastPathComponent)+\(#function)")
    }

}
