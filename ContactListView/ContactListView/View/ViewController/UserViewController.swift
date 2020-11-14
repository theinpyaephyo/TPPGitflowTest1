//
//  UserViewController.swift
//  ContactListView
//
//  Created by Ye Ko Ko Htet on 14/11/2020.
//  Copyright © 2020 THEIN PYAE PHYO. All rights reserved.
//

import UIKit

struct UserVO {
    var id: Int
    var email: String
    var firstName: String
    var lastName: String
    var avatar: String
    
    init(json: [String: Any]) {
        id = json["id"] as? Int ?? 0
        email = json["email"] as? String ?? ""
        firstName = json["first_name"] as? String ?? ""
        lastName = json["last_name"] as? String ?? ""
        avatar = json["avatar"] as? String ?? ""
    }
}

class UserViewController: UIViewController {
    
    static let identifier = "UserViewController"

    @IBOutlet weak var lblUserEmail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let url = URL(string: "https://reqres.in/api/users/2") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            
            guard let data = data else { return }
            
            do {
                guard let responseDataKeyValueArray = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else { return }
                
                let user = UserVO(json: responseDataKeyValueArray["data"] as! [String: Any])
                
                DispatchQueue.main.async {
                    self.lblUserEmail.text = user.lastName
                }
                
                print(user)
                
            } catch let jsonErr {
                print(jsonErr.localizedDescription)
            }

        }.resume()
    }

}
