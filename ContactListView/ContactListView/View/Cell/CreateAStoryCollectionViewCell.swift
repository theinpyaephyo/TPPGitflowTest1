//
//  CreateAStoryCollectionViewCell.swift
//  ContactListView
//
//  Created by THEIN PYAE PHYO on 2020/10/26.
//  Copyright © 2020 THEIN PYAE PHYO. All rights reserved.
//

import UIKit
import SDWebImage

class CreateAStoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CreateAStoryCollectionViewCell"

   
    @IBOutlet weak var profileImage: UIView!
    @IBOutlet weak var ivProfileImage: UIImageView!
    @IBOutlet weak var addPlus: UIView!
    @IBOutlet weak var ivAddPlus: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        addPlus.layer.cornerRadius = addPlus.frame.width / 2
        ivAddPlus.layer.cornerRadius = ivAddPlus.frame.width / 2
        
        profileImage.layer.cornerRadius = 10
        
        ivProfileImage.layer.cornerRadius = 10
        ivProfileImage.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
    }

}
