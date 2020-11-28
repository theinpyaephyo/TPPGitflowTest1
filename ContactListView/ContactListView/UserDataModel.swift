//
//  UserDataModel.swift
//  ContactListView
//
//  Created by Ye Ko on 28/11/2020.
//  Copyright © 2020 THEIN PYAE PHYO. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

final class UserDataModel {
 
    private init() {}
    
    static let shared = UserDataModel()
    
    let decoder = JSONDecoder()
    
    func getUsers(page: Int = 1, success: @escaping ([UserVO]) -> Void, failure: @escaping (String) -> Void) {
        
        let parameters: [String: Any] = [
            "page": page
        ]
        
        NetworkClient.shared.getData(route: "api/users", httpHeaders: [:], parameters: parameters) { (data) in
            
            guard let data = data as? JSON else { return }
            
            do {
                self.decoder.keyDecodingStrategy = .convertFromSnakeCase
                let users = try self.decoder.decode([UserVO].self, from: Data(data["data"].rawData()))
                success(users)
            } catch let jsonErr {
                print(jsonErr)
            }
            
        } failure: { (err) in
            print(err)
        }
    }

}
