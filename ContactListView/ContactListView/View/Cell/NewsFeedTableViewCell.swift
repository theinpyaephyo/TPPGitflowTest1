//
//  NewsFeedTableViewCell.swift
//  ContactListView
//
//  Created by THEIN PYAE PHYO on 2020/10/28.
//  Copyright © 2020 THEIN PYAE PHYO. All rights reserved.
//

import UIKit
import SDWebImage

class NewsFeedTableViewCell: UITableViewCell {

    static let identifier = "NewsFeedTableViewCell"
    
    @IBOutlet weak var ivProfileImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        ivProfileImage.sd_setImage(with: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSsMUhHE3cKLX-RNVQP1_Yu79Gd2Ix3nQ0p=CAU"), placeholderImage: UIImage(named: "black"))
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

            }
    
}
