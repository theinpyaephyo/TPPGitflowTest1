//
//  ContactListViewController.swift
//  ContactListView
//
//  Created by THEIN PYAE PHYO on 2020/10/04.
//  Copyright © 2020 THEIN PYAE PHYO. All rights reserved.
//

import UIKit

class ContactListViewController: UIViewController{

    @IBOutlet weak var tableViewContactList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewContactList.register(UINib(nibName: ContactListViewItemTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ContactListViewItemTableViewCell.identifier)
        
        tableViewContactList.dataSource = self
        
        
    }
    

}

extension ContactListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ContactListViewItemTableViewCell.identifier, for: indexPath) as! ContactListViewItemTableViewCell
        return cell
    }
    
    
    
    
}
