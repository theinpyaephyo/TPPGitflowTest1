//
//  RoomItemCollectionViewCell.swift
//  ContactListView
//
//  Created by THEIN PYAE PHYO on 2020/10/22.
//  Copyright © 2020 THEIN PYAE PHYO. All rights reserved.
//

import UIKit

class RoomItemCollectionViewCell: UICollectionViewCell {

    static let identifier = "RoomItemCollectionViewCell"
    @IBOutlet weak var ivProfileImage: UIImageView!
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var innerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        ivProfileImage.layer.cornerRadius = ivProfileImage.frame.width / 2
        outerView.layer.cornerRadius = outerView.frame.width / 2
        innerView.layer.cornerRadius = innerView.frame.width / 2
        
        
    }

}
