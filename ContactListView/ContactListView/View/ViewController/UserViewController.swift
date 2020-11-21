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
    
    var users: [UserVO] = []
    
    let usersImages = ["https://st1.latestly.com/wp-content/uploads/2019/08/Gigi-Hadid-781x441.jpg","https://www.shemazing.net/wp-content/uploads/2016/02/capture_1151_2.jpg","https://assets.capitalfm.com/2016/11/gigi-hadid-hottest-photos-2-1457969541-view-1.jpg","https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F20%2F2019%2F07%2Fyara.jpg&q=85","https://static.independent.co.uk/s3fs-public/thumbnails/image/2019/02/07/13/kiki-layne.jpg","https://variety.com/wp-content/uploads/2020/07/yara-shahidi.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewUserList.register(UINib(nibName: UserTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: UserTableViewCell.identifier)
        
        tableViewUserList.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        
        tableViewUserList.separatorStyle = .none
        
        tableViewUserList.dataSource = self
        
        AF.request("https://reqres.in/api/users?page=2").responseJSON { (response) in

            switch response.result {
            
            case .success(let data):

                let json = JSON(data)

                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase

                do {
                    self.users = try decoder.decode([UserVO].self, from: Data(json["data"].rawData()))
                    
                    var count = 0
                    self.users.forEach { (user) in
                        user.avatar = self.usersImages[count]
                        count += 1
                    }
                    
                    self.tableViewUserList.reloadData()

                } catch let jsonErr {
                    print(jsonErr)
                }

                break

            case .failure(let err):
                print(err.localizedDescription)
                break

            }

        }

//        guard let url = URL(string: "https://reqres.in/api/users/2") else { return }
//
//        URLSession.shared.dataTask(with: url) { (data, response, err) in
//
//            guard let data = data else { return }
//
//            do {
//
//                guard let responseDataKeyValueArray = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else { return }
//
//                let user = UserVO(json: responseDataKeyValueArray["data"] as! [String: Any])
//
//                DispatchQueue.main.async {
//                    self.lblUserEmail.text = user.lastName
//                }
//
//                print(user)
//
//            } catch let jsonErr {
//                print(jsonErr.localizedDescription)
//            }
//
//        }.resume()
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
