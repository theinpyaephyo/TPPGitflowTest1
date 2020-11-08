//
//  RoomItemDetailViewController.swift
//  ContactListView
//
//  Created by THEIN PYAE PHYO on 2020/11/08.
//  Copyright © 2020 THEIN PYAE PHYO. All rights reserved.
//

import UIKit
import SDWebImage

class RoomItemDetailViewController: UIViewController {
    
    static let identifier = "RoomItemDetailViewController"
    
    @IBOutlet weak var closeView: UIView!
    @IBOutlet weak var ivStoryImageView: UIImageView!
  
    var roomImage: String? {
        didSet {
           if let imageUrl = roomImage {
                ivStoryImageView.sd_setImage(with: URL(string: imageUrl))
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        closeView.isUserInteractionEnabled = true
        
        let tapGesture = UIGestureRecognizer(target: self, action: #selector(onClick))
        closeView.addGestureRecognizer(tapGesture)

        
    }
    
    @objc func onClick() {
        self.dismiss(animated: true, completion: nil)
    }
   

}
