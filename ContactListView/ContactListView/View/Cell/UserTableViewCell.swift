//
//  UserTableViewCell.swift
//  ContactListView
//
//  Created by Ye Ko Ko Htet on 21/11/2020.
//  Copyright © 2020 THEIN PYAE PHYO. All rights reserved.
//

import UIKit
import SDWebImage

class UserTableViewCell: UITableViewCell {
    
    static let identifier = "UserTableViewCell"

    @IBOutlet weak var ivUserAvatar: UIImageView!
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var lblUserEmail: UILabel!
    
    var user: UserVO? {
        didSet {
            if let user = user {
                ivUserAvatar.sd_setImage(with: URL(string: user.avatar))
                lblUsername.text = "\(user.firstName) \(user.lastName)"
                lblUserEmail.text = user.email
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
