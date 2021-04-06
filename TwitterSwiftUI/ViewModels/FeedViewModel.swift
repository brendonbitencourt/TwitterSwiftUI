//
//  FeedViewModel.swift
//  TwitterSwiftUI
//
//  Created by Braga, Brendon on 06/04/21.
//

import SwiftUI
import Firebase

class FeedViewModel: ObservableObject {
    
    @Published var tweets = [Tweet]()
    
    init(withMOCK: Bool = false) {
        if !withMOCK {
            fetchTweets()
        } else {
            self.tweets = MOCK_TWEETS
        }
    }
    
    func fetchTweets() {
        COLLECTION_TWEETS.getDocuments { (snapshot, _) in
            guard let documents = snapshot?.documents else { return }
            self.tweets = documents.compactMap({ (documentSnapshot) -> Tweet? in
                try? documentSnapshot.data(as: Tweet.self)
            })
        }
    }
    
}
