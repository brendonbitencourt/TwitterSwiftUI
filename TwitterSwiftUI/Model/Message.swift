//
//  Message.swift
//  TwitterSwiftUI
//
//  Created by Brendon Bitencourt Braga on 2021-03-25.
//

import Foundation
import Firebase

struct Message: Identifiable, Codable {
    let id: String
    let text: String
    let toId: String
    let fromId: String
    let timestamp: Timestamp
    var user: User?
    
    enum CodingKeys: String, CodingKey {
        case id
        case text
        case toId
        case fromId
        case timestamp
    }
    
    func isFromCurrentUser() -> Bool {
        return Auth.auth().currentUser?.uid == fromId
    }
    
    func chatPartnerId() -> String {
        return isFromCurrentUser() ? toId : fromId
    }
}

let MOCK_MESSAGE = Message(id: NSUUID().uuidString, text: "Message", toId: "", fromId: "", timestamp: Timestamp(date: Date()), user: MOCK_USER)

let MOCK_MESSAGES: [Message] = [MOCK_MESSAGE, MOCK_MESSAGE, MOCK_MESSAGE, MOCK_MESSAGE] 
