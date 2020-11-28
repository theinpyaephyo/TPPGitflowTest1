//
//  NetworkClient.swift
//  ContactListView
//
//  Created by Ye Ko Ko Htet on 22/11/2020.
//  Copyright © 2020 THEIN PYAE PHYO. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkClient {
    
    private init() {}
    
    static let shared = NetworkClient()
    
    let baseUrl = "https://reqres.in/"
    
    func getData(route: String,
                 httpHeaders: HTTPHeaders,
                 parameters: Parameters,
                 success: @escaping (Any) -> Void,
                 failure: @escaping (String) -> Void) {
        
        AF.request(baseUrl + route, method: .get, parameters: parameters, headers: httpHeaders).responseJSON { (response) in
            
            switch response.result {
            
            case .success(let data):
                let json = JSON(data)
                success(json)
                break

            case .failure(let err):
                failure(err.localizedDescription)
                break

            }
        }
    }

}
