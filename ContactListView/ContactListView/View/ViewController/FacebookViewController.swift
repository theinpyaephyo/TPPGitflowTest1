//
//  FacebookViewController.swift
//  ContactListView
//
//  Created by THEIN PYAE PHYO on 2020/10/24.
//  Copyright © 2020 THEIN PYAE PHYO. All rights reserved.
//

import UIKit

class FacebookViewController: UIViewController {
    
    static let identifier = "FacebookViewController"

    @IBOutlet weak var messengerOutter: UIView!
    @IBOutlet weak var notificationNumber: UIView!
    @IBOutlet weak var magnifyingglass: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var addStoryCollectionView: UICollectionView!
    @IBOutlet weak var collectionViewRoomItem: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        messengerOutter.layer.cornerRadius = messengerOutter.frame.width / 2
        notificationNumber.layer.cornerRadius = notificationNumber.frame.width / 2
        magnifyingglass.layer.cornerRadius = magnifyingglass.frame.width / 2
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
        
        
        addStoryCollectionView.register(UINib(nibName: CreateAStoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CreateAStoryCollectionViewCell.identifier)
        
        
        addStoryCollectionView.register(UINib(nibName: AddStoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: AddStoryCollectionViewCell.identifier)
        
        addStoryCollectionView.dataSource = self
        
         addStoryCollectionView.delegate = self
        
        
        collectionViewRoomItem.register(UINib(nibName: CreateRoomCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CreateRoomCollectionViewCell.identifier)
        
        
        collectionViewRoomItem.register(UINib(nibName: RoomItemCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: RoomItemCollectionViewCell.identifier)
        
        collectionViewRoomItem.dataSource = self
        
        collectionViewRoomItem.delegate = self
        
        collectionViewRoomItem.contentInset = UIEdgeInsets(top: 0, left: 2, bottom: 0, right: 2)
        addStoryCollectionView.contentInset = UIEdgeInsets(top: 2, left: 8, bottom: 2, right: 8)
    }
    
  
    
}
extension FacebookViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == addStoryCollectionView {
            
            return 20
            
        } else {
            
            return 10
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == addStoryCollectionView {
            if indexPath.row == 0 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CreateAStoryCollectionViewCell.identifier, for: indexPath) as! CreateAStoryCollectionViewCell
                return cell
                
            } else {
                
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AddStoryCollectionViewCell.identifier, for: indexPath) as! AddStoryCollectionViewCell
                return cell
            }
            
        } else {
            
            if indexPath.row == 0 {
                
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CreateRoomCollectionViewCell.identifier, for: indexPath) as! CreateRoomCollectionViewCell
                return cell
                
            } else {
                
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RoomItemCollectionViewCell.identifier, for: indexPath) as! RoomItemCollectionViewCell
                return cell
            }
            
        }
        
    }
    
    
    
}

extension FacebookViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == addStoryCollectionView {
           return CGSize(width: 75, height: 120)
        } else {
            if indexPath.row == 0 {
                
                return CGSize(width: 123, height: 61)
                
            } else {
                
                return CGSize(width: 53, height: 61)
            }
           
        }
        
    }
}
