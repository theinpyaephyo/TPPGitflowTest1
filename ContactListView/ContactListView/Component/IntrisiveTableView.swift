//
//  IntrisiveTableView.swift
//  ContactListView
//
//  Created by Ye Ko Ko Htet on 30/10/2020.
//  Copyright © 2020 THEIN PYAE PHYO. All rights reserved.
//

import UIKit

class IntrinsicTableView: UITableView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override var contentSize:CGSize {
        didSet {
            self.invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        self.layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
    
}
