//
//  StoryImageDetailsViewController.swift
//  ContactListView
//
//  Created by Ye Ko Ko Htet on 07/11/2020.
//  Copyright © 2020 THEIN PYAE PHYO. All rights reserved.
//

import UIKit
import SDWebImage

class StoryImageDetailsViewController: UIViewController {
    
    static let identifier = "StoryImageDetailsViewController"

    @IBOutlet weak var ivStoryImage: UIImageView!
    @IBOutlet weak var btnClose: UIView!
    
    var storyImage: String? {
        didSet {
            if let storyImage = storyImage {
                ivStoryImage.sd_setImage(with: URL(string: storyImage), placeholderImage: UIImage(named: "black"))
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1. enable user interaction
        btnClose.isUserInteractionEnabled = true
        
        // 2. add gesture
        let tapGestuer = UITapGestureRecognizer(target: self, action: #selector(onClose))
        btnClose.addGestureRecognizer(tapGestuer)
    }
    
    @objc func onClose() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
