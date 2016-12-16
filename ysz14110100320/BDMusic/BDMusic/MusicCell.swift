//
//  MusicCell.swift
//  BDMusic
//
//  Created by Freeman on 2016/12/11.
//  Copyright © 2016年 Freeman. All rights reserved.
//

import UIKit

class MusicCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var showPic: UIImageView!
    @IBOutlet weak var detail: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layoutIfNeeded()
        showPic.layer.cornerRadius = self.showPic.frame.width/2
        showPic.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
