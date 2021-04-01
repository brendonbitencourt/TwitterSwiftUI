//
//  User.swift
//  TwitterSwiftUI
//
//  Created by Braga, Brendon on 01/04/21.
//

import Foundation
import Firebase

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
    
    func isCurrentUser() -> Bool {
        return Auth.auth().currentUser?.uid == self.id
    }
}

let MOCK_USER = User(id: NSUUID().uuidString, username: "brendon.braga", profileImageUrl: "https://firebasestorage.googleapis.com/v0/b/twitterswiftui-98021.appspot.com/o/DE373011-0C99-4D18-9450-5328BCDD0375?alt=media&token=53253dda-b075-485e-aa77-87d1c14ee4e5", fullname: "Brendon Bitencourt", email: "brendon.braga@gmail.com")

let MOCK_USERS = [MOCK_USER, MOCK_USER, MOCK_USER, MOCK_USER, MOCK_USER, MOCK_USER]
