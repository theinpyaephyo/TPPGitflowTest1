//
//  RoomItemCollectionViewCell.swift
//  ContactListView
//
//  Created by THEIN PYAE PHYO on 2020/10/22.
//  Copyright © 2020 THEIN PYAE PHYO. All rights reserved.
//

import UIKit
import SDWebImage

class RoomItemCollectionViewCell: UICollectionViewCell {

    static let identifier = "RoomItemCollectionViewCell"
    
    var addRoomItemDelegate: AddRoomItemDelegate?
    
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var ivProfileImage: UIImageView!
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var innerView: UIView!
    
    // computed property
    var profileImageUrl: ImageUrlVO? {
        didSet {
            if let imageUrl = profileImageUrl {
                ivProfileImage.sd_setImage(with: URL(string: imageUrl.url ?? ""), placeholderImage: UIImage(named: "black"))
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        ivProfileImage.layer.cornerRadius = ivProfileImage.frame.width / 2
        outerView.layer.cornerRadius = outerView.frame.width / 2
        innerView.layer.cornerRadius = innerView.frame.width / 2
        
        parentView.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onClick))
        parentView.addGestureRecognizer(tapGesture)
    }

    @objc func onClick() {
        if let imageUrl = profileImageUrl?.url {
             addRoomItemDelegate?.onClick(imageUrl: imageUrl)
        }
       
    }
    
}
