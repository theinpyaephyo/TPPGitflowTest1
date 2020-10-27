//
//  ContactListViewItemTableViewCell.swift
//  ContactListView
//
//  Created by THEIN PYAE PHYO on 2020/10/04.
//  Copyright © 2020 THEIN PYAE PHYO. All rights reserved.
//

import UIKit

class ContactListViewItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblLike: UILabel!
    @IBOutlet weak var lblWow: UILabel!
    @IBOutlet weak var lblLove: UILabel!
    @IBOutlet weak var imageProfile: UIImageView!
    
    static let identifier = "ContactListViewItemTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageProfile.layer.masksToBounds = true
        imageProfile.layer.cornerRadius = imageProfile.bounds.width / 2
        
        lblLike.text = "👍🏻"
        lblLike.textAlignment = .center
        lblLike.layer.masksToBounds = true
        lblLike.layer.cornerRadius = lblLike.frame.width / 2
        
        lblWow.text = "😮"
        lblWow.textAlignment = .center
        lblWow.layer.masksToBounds = true
        lblWow.layer.cornerRadius = lblWow.frame.width / 2
        
        lblLove.text = "🤍"
        lblLove.textAlignment = .center
        lblLove.layer.masksToBounds = true
        lblLove.layer.cornerRadius = lblLove.frame.width/2
        
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
