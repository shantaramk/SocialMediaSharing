//
//  PhotoCell.swift
//  SocialShareDemo
//
//  Created by Shantaram K on 29/01/20.
//  Copyright © 2020 Shantaram K. All rights reserved.
//

import UIKit

class PhotoCell: UITableViewCell {

    @IBOutlet weak var photoImgaeView: UIImageView!
    @IBOutlet weak var shareButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
