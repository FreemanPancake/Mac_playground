//
//  MyCell.swift
//  MyTable
//
//  Created by Freeman on 2016/11/12.
//  Copyright © 2016年 Freeman. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var islearn: UILabel!
    @IBOutlet weak var learnnumber: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
