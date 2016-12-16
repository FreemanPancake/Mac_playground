//
//  Model.swift
//  JSONSample
//
//  Created by Freeman on 2016/11/22.
//  Copyright © 2016年 Freeman. All rights reserved.
//

import Foundation
class Person : NSObject {
    var name:String?
    var id : Int?
    var hobby : [String]?
    
    class func personWithArray(dict:NSDictionary?) -> Person?{
        
        if dict == nil {
            return nil
        }
        
        let model : Person? = Person()
        model?.name = dict!["name"] as? String
        model?.id = dict!["id"] as? Int
        model?.hobby = dict!["hobbyList"] as? [String]
        return model
    }
}
