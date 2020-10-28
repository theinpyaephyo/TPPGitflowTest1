//
//  AddStoryCollectionViewCell.swift
//  ContactListView
//
//  Created by THEIN PYAE PHYO on 2020/10/24.
//  Copyright © 2020 THEIN PYAE PHYO. All rights reserved.
//

import UIKit

class AddStoryCollectionViewCell: UICollectionViewCell {

    static let identifier = "AddStoryCollectionViewCell"
    
    
    @IBOutlet weak var profileOutter: UIView!
    @IBOutlet weak var addStoryImage: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profileOutter.layer.cornerRadius = profileOutter.frame.width / 2
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
        addStoryImage.layer.cornerRadius = 10
        
        
    }

}