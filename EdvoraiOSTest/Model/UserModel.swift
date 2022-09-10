//
//  UserModel.swift
//  EdvoraiOSTest
//
//  Created by 林大屍 on 2022/9/11.
//

import Foundation


struct User: Decodable, Identifiable{
    let id = UUID()
    let userID: Int
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case name
    }
}
