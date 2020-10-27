//
//  CreateRoomCollectionViewCell.swift
//  ContactListView
//
//  Created by THEIN PYAE PHYO on 2020/10/23.
//  Copyright © 2020 THEIN PYAE PHYO. All rights reserved.
//

import UIKit

class CreateRoomCollectionViewCell: UICollectionViewCell {


    @IBOutlet weak var outterView: UIView!
    @IBOutlet weak var innerView: UIView!
    
    static let identifier = "CreateRoomCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        outterView.layer.cornerRadius = outterView.frame.height / 2
        innerView.layer.cornerRadius = innerView.frame.height / 2
        
        
    }

}
