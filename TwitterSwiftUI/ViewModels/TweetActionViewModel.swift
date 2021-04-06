//
//  TweetActionViewModel.swift
//  TwitterSwiftUI
//
//  Created by Braga, Brendon on 06/04/21.
//

import SwiftUI
import Firebase

class TweetActionViewModel: ObservableObject {
    
    @Published var didLike = false
    let tweet: Tweet
    
    init(tweet: Tweet) {
        self.tweet = tweet
        checkIfUserLikedTweet()
    }
    
    func likeTweet() {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let tweetLikesRef = COLLECTION_TWEETS.document(tweet.id).collection("tweet-likes")
        let userLikesRef = COLLECTION_USERS.document(currentUid).collection("user-likes")
        
        // TODO: Remove
        COLLECTION_TWEETS.document(tweet.id).updateData(["likes": (tweet.likes + 1)])
        
        tweetLikesRef.document(currentUid).setData([:]) { (_) in
            userLikesRef.document(self.tweet.id).setData([:]) { (_) in
                self.didLike = true
            }
        }
    }
    
    func unlikeTweet() {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let tweetLikesRef = COLLECTION_TWEETS.document(tweet.id).collection("tweet-likes")
        let userLikesRef = COLLECTION_USERS.document(currentUid).collection("user-likes")
        
        // TODO: Remove
        COLLECTION_TWEETS.document(tweet.id).updateData(["likes": (tweet.likes - 1)])
        
        tweetLikesRef.document(currentUid).delete { (_) in
            userLikesRef.document(self.tweet.id).delete { (_) in
                self.didLike = false
            }
        }
    }
    
    func checkIfUserLikedTweet() {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let userLikesRef = COLLECTION_USERS.document(currentUid).collection("user-likes")
        
        userLikesRef.document(tweet.id).getDocument { (snapshot, _) in
            guard let didLike = snapshot?.exists else { return }
            self.didLike = didLike
        }
    }
}
