//
//  HomeViewController.swift
//  ContactListView
//
//  Created by THEIN PYAE PHYO on 2020/10/22.
//  Copyright © 2020 THEIN PYAE PHYO. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var collectionViewRoomItemList: UICollectionView!
    
    static let identifier = "HomeViewController"

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionViewRoomItemList.register(UINib(nibName: RoomItemCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: RoomItemCollectionViewCell.identifier)
        
        collectionViewRoomItemList.register(UINib(nibName: CreateRoomCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CreateRoomCollectionViewCell.identifier)
        
        collectionViewRoomItemList.dataSource = self
        
        collectionViewRoomItemList.delegate = self
        
        collectionViewRoomItemList.contentInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        
        
        
        
    }
    
   
   

}
extension HomeViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RoomItemCollectionViewCell.identifier, for: indexPath) as! RoomItemCollectionViewCell
//        return cell
        
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CreateRoomCollectionViewCell.identifier, for: indexPath) as! CreateRoomCollectionViewCell
            return cell
            
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RoomItemCollectionViewCell.identifier, for: indexPath) as! RoomItemCollectionViewCell
            return cell
        }
        
    }
    
       
       
   }

extension HomeViewController: UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        if indexPath.row == 0 {
            return CGSize(width: 123, height: 61)
        } else {
            return CGSize(width: 53, height: 61)
        }
    
    }
    
}
