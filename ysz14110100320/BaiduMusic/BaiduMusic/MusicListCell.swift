//
//  MusicListCell.swift
//  BaiduMusic
//
//  Created by Freeman on 2016/12/8.
//  Copyright © 2016年 Freeman. All rights reserved.
//

import UIKit

class MusicListCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var detail: UILabel!
    @IBOutlet weak var musicImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
