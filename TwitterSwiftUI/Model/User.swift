//
//  User.swift
//  TwitterSwiftUI
//
//  Created by Braga, Brendon on 01/04/21.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let username: String
    let profileImageUrl: String
    let fullname: String
    let email: String
    
    enum CodingKeys: String, CodingKey {
        case id  = "uid"
        case username
        case profileImageUrl
        case fullname
        case email
    }
}
