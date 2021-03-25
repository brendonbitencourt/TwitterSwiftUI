//
//  Message.swift
//  TwitterSwiftUI
//
//  Created by Brendon Bitencourt Braga on 2021-03-25.
//

import Foundation

struct MockMessage: Identifiable {
    let id: Int
    let imageName: String
    let messageText: String
    let isCurrentUser: Bool
}

let MOCK_MESSAGES: [MockMessage] = [
    MockMessage(id: 0, imageName: "spiderman", messageText: "Hey whats's up", isCurrentUser: false),
    MockMessage(id: 1, imageName: "batman", messageText: "Not much, you?", isCurrentUser: true),
    MockMessage(id: 2, imageName: "batman", messageText: "How's the marvel universe ?", isCurrentUser: true),
    MockMessage(id: 3, imageName: "spiderman", messageText: "It's prety good dude", isCurrentUser: false),
    MockMessage(id: 4, imageName: "spiderman", messageText: "How's ypur battle with the Joker ?", isCurrentUser: false),
    MockMessage(id: 5, imageName: "batman", messageText: "Not going so hot...", isCurrentUser: true)
] 
