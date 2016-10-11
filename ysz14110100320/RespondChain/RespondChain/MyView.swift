//
//  MyView.swift
//  RespondChain
//
//  Created by Freeman on 16/10/11.
//  Copyright © 2016年 Freeman. All rights reserved.
//

import UIKit

class MyView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("\(#function)")
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        <#code#>
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        <#code#>
    }
    
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        <#code#>
    }

}
