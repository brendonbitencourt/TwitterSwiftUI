//
//  Tweet.swift
//  TwitterSwiftUI
//
//  Created by Braga, Brendon on 06/04/21.
//

import Foundation
import Firebase

struct Tweet: Identifiable, Codable {
    let id: String
    let username: String
    let uid: String
    let profileImageUrl: String
    let fullname: String
    let caption: String
    let likes: Int
    let timestamp: Timestamp
}

let MOCK_TWEET = Tweet(id: NSUUID().uuidString, username: "brendon.braga", uid: "NAZA5bHUsHQUgcaejcbQpYk7ib83", profileImageUrl: "https://firebasestorage.googleapis.com/v0/b/twitterswiftui-98021.appspot.com/o/DE373011-0C99-4D18-9450-5328BCDD0375?alt=media&token=53253dda-b075-485e-aa77-87d1c14ee4e5", fullname: "Brendon Bitencourt", caption: "First Tweet", likes: 3, timestamp: Timestamp(date: Date()))

let MOCK_TWEETS = [MOCK_TWEET, MOCK_TWEET, MOCK_TWEET, MOCK_TWEET]
