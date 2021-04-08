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

struct MockMessage: Identifiable {
    let id: Int
    let imageName: String
    let messageText: String
    let isCurrentUser: Bool
}

let MOCK_MESSAGE = Message(id: NSUUID().uuidString, text: "Message", toId: "", fromId: "", timestamp: Timestamp(date: Date()), user: MOCK_USER)

let MOCK_MESSAGES: [MockMessage] = [
    MockMessage(id: 0, imageName: "spiderman", messageText: "Hey whats's up", isCurrentUser: false),
    MockMessage(id: 1, imageName: "batman", messageText: "Not much, you?", isCurrentUser: true),
    MockMessage(id: 2, imageName: "batman", messageText: "How's the marvel universe ?", isCurrentUser: true),
    MockMessage(id: 3, imageName: "spiderman", messageText: "It's prety good dude", isCurrentUser: false),
    MockMessage(id: 4, imageName: "spiderman", messageText: "How's ypur battle with the Joker ?", isCurrentUser: false),
    MockMessage(id: 5, imageName: "batman", messageText: "Not going so hot...", isCurrentUser: true)
] 
