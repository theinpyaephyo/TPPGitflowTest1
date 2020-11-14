//
//  CreateRoomDetailViewController.swift
//  ContactListView
//
//  Created by THEIN PYAE PHYO on 2020/11/14.
//  Copyright © 2020 THEIN PYAE PHYO. All rights reserved.
//

import UIKit

class CreateRoomDetailViewController: UIViewController {
    
    static let identifier = "CreateRoomDetailViewController"

    @IBOutlet weak var collectionViewRoomItemsGridView: UICollectionView!
    @IBOutlet weak var btnBack: UIView!

    var addRoomItemObjectList: [ImageUrlVO]? {
        didSet {
            if let _ = addRoomItemObjectList {
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionViewRoomItemsGridView.register(UINib(nibName: RoomItemCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: RoomItemCollectionViewCell.identifier)
        
        collectionViewRoomItemsGridView.dataSource = self
        
        collectionViewRoomItemsGridView.delegate = self
        
        
        collectionViewRoomItemsGridView.contentInset = UIEdgeInsets(top: 0, left: 45, bottom: 0, right: 45)
        
        btnBack.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onClick))
        btnBack.addGestureRecognizer(tapGesture)
       
    }
    
    @objc func onClick() {
        self.dismiss(animated: true, completion: nil)
    }

   

}

extension CreateRoomDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return addRoomItemObjectList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RoomItemCollectionViewCell.identifier, for: indexPath) as! RoomItemCollectionViewCell
        cell.profileImageUrl = addRoomItemObjectList?[indexPath.row]
        return cell
    }
    
    
}

extension CreateRoomDetailViewController: UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width / 3 , height: 190)
    }
}
