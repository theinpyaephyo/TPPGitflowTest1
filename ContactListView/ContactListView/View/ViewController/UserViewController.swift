//
//  UserViewController.swift
//  ContactListView
//
//  Created by Ye Ko Ko Htet on 14/11/2020.
//  Copyright © 2020 THEIN PYAE PHYO. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

//struct UserVO {
//    var id: Int
//    var email: String
//    var firstName: String
//    var lastName: String
//    var avatar: String
//
//    init(json: [String: Any]) {
//        id = json["id"] as? Int ?? 0
//        email = json["email"] as? String ?? ""
//        firstName = json["first_name"] as? String ?? ""
//        lastName = json["last_name"] as? String ?? ""
//        avatar = json["avatar"] as? String ?? ""
//    }
//}


class UserVO: Codable {
    var id: Int
    var email: String
    var firstName: String
    var lastName: String
    var avatar: String
}

struct DataVO: Codable {
    var data: UserVO
}

class UserViewController: UIViewController {
    
    static let identifier = "UserViewController"

    @IBOutlet weak var tableViewUserList: UITableView!
    
    let activityIndicator = UIActivityIndicatorView()
    
    var users: [UserVO] = []
    
    var page = 1
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewUserList.register(UINib(nibName: UserTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: UserTableViewCell.identifier)
        
        tableViewUserList.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        
        tableViewUserList.separatorStyle = .none
        
        tableViewUserList.dataSource = self
        tableViewUserList.delegate = self
                
        loadInitialData()
    }
    
    func loadInitialData() {
        
        UserDataModel.shared.getUsers { (users) in
            self.users = users
            self.tableViewUserList.reloadData()
        } failure: { (err) in
            print(err)
        }
        
//        NetworkClient.shared.getData(route: "api/users") { (data) in
//
//            guard let data = data as? JSON else { return }
//
//            let decoder = JSONDecoder()
//            decoder.keyDecodingStrategy = .convertFromSnakeCase
//
//            do {
//
//                self.users = try decoder.decode([UserVO].self, from: Data(data["data"].rawData()))
//
//                self.tableViewUserList.reloadData()
//
//            } catch let jsonErr {
//                print(jsonErr.localizedDescription)
//            }
//
//        } failure: { (err) in
//            print(err)
//        }
        
    }
    
    
    
    func loadMoreData(page: Int) {
        UserDataModel.shared.getUsers(page: page) { (users) in
            self.users.append(contentsOf: users)
            self.tableViewUserList.reloadData()
        } failure: { (err) in
            print(err)
        }
    }

}

extension UserViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier, for: indexPath) as! UserTableViewCell
        cell.user = users[indexPath.row]
        return cell
    }
}

extension UserViewController: UITableViewDelegate {
        
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        // check tableview reachs end method
        if tableViewUserList.contentOffset.y >= (tableViewUserList.contentSize.height - tableViewUserList.frame.size.height) {
            
            if page == 1 {
                page += 1
                loadMoreData(page: page)
            }
        }
    }
    
}
