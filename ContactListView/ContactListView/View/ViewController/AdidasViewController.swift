//
//  AdidasViewController.swift
//  ContactListView
//
//  Created by THEIN PYAE PHYO on 2020/11/03.
//  Copyright © 2020 THEIN PYAE PHYO. All rights reserved.
//

import UIKit

class AdidasViewController: UIViewController {
    
    static let identifier = "AdidasViewController"

    @IBOutlet weak var detailDescriptionView: CardView!
    @IBOutlet weak var upperView: UIView!
    @IBOutlet weak var ivShoeImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailDescriptionView.layer.cornerRadius = 50
        detailDescriptionView.layer.maskedCorners = [.layerMinXMinYCorner]
        
        upperView.layer.cornerRadius = 50
        upperView.layer.maskedCorners = [.layerMinXMinYCorner]
        
//        ivShoeImage.transform = ivShoeImage.transform.rotated(by: .pi / 4)
    }
    

    

}
