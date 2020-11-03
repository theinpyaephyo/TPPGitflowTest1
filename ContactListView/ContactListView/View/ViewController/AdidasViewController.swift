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

    @IBOutlet weak var detailDescriptionView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailDescriptionView.layer.cornerRadius = 100
        detailDescriptionView.layer.maskedCorners = [.layerMinXMinYCorner]
    }
    

    

}
