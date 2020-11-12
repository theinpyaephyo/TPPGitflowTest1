//
//  CreateStoryDetailsViewController.swift
//  ContactListView
//
//  Created by Ye Ko Ko Htet on 12/11/2020.
//  Copyright © 2020 THEIN PYAE PHYO. All rights reserved.
//

import UIKit

class CreateStoryDetailsViewController: UIViewController {
    
    static let identifier = "CreateStoryDetailsViewController"
    
    @IBOutlet weak var collecitonViewStoryGridList: UICollectionView!
    
    var addStoryObjectList: [ImageUrlVO]? {
        didSet {
            if let _ = addStoryObjectList {
                collecitonViewStoryGridList.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // register
        collecitonViewStoryGridList.register(UINib(nibName: AddStoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: AddStoryCollectionViewCell.identifier)
        
        collecitonViewStoryGridList.contentInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        
        // datasource
        collecitonViewStoryGridList.dataSource = self
        
        // delegate
        collecitonViewStoryGridList.delegate = self
        
    }
    
}

extension CreateStoryDetailsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return addStoryObjectList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AddStoryCollectionViewCell.identifier, for: indexPath) as! AddStoryCollectionViewCell
        cell.storyImageUrl = addStoryObjectList?[indexPath.row]
        return cell
    }
}

extension CreateStoryDetailsViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width / 3 - 16, height: 190)
    }
}

