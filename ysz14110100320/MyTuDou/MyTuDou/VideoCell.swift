//
//  VideoCell.swift
//  MyTuDou
//
//  Created by Freeman on 2016/12/1.
//  Copyright © 2016年 Freeman. All rights reserved.
//

import UIKit

class VideoCell: UITableViewCell {
    
    
    @IBOutlet weak var videoImage: UIImageView!
    @IBOutlet weak var videoTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
