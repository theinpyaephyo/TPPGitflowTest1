//
//  AddStoryCollectionViewCell.swift
//  ContactListView
//
//  Created by THEIN PYAE PHYO on 2020/10/24.
//  Copyright © 2020 THEIN PYAE PHYO. All rights reserved.
//

import UIKit
import SDWebImage

class AddStoryCollectionViewCell: UICollectionViewCell {

    static let identifier = "AddStoryCollectionViewCell"
    
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var profileOutter: UIView!
    @IBOutlet weak var addStoryImage: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var transparentView: UIView!
    
//    var addStoryItemDelegate: AddStoryItemDelegate?
    
    var storyImageUrl: ImageUrlVO? {
        
        didSet{
            if let storyImage = storyImageUrl{
                
                addStoryImage.sd_setImage(with: URL(string: storyImage.url ?? ""), placeholderImage: UIImage(named: "black"))
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profileOutter.layer.cornerRadius = profileOutter.frame.width / 2
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
        addStoryImage.layer.cornerRadius = 10
        transparentView.layer.cornerRadius = 10
        
//        parentView.isUserInteractionEnabled = true
//        
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onClickStory))
//        parentView.addGestureRecognizer(tapGesture)
    
    }
    
    @objc func onClickStory() {
//        if let imageUrl = storyImageUrl?.url {
//            addStoryItemDelegate?.onTheinPayePhyo(imageUrl: imageUrl)
//        }
    }

}
