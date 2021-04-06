//
//  ProfileViewMode.swift
//  TwitterSwiftUI
//
//  Created by Braga, Brendon on 01/04/21.
//

import SwiftUI
import Firebase

class ProfileViewModel: ObservableObject {
    
    @Published var isFollowed = false
    @Published var userTweets = [Tweet]()
    @Published var likedTweets = [Tweet]()
    let user: User
    
    init(user: User) {
        self.user = user
        self.checkIfUserIsFollowed()
    }
    
    func follow(completion: @escaping () -> Void) {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        let followingRef = COLLECTION_FOLLOWING.document(currentUid).collection("user-following")
        let followersRef = COLLECTION_FOLLOWERS.document(self.user.id).collection("user-followers")
        
        followingRef.document(user.id).setData([:]) { (_) in
            followersRef.document(currentUid).setData([:]) { (_) in
                self.isFollowed = true
                completion()
            }
        }
    }
    
    func unfollow(completion: @escaping () -> Void) {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        let followingRef = COLLECTION_FOLLOWING.document(currentUid).collection("user-following")
        let followersRef = COLLECTION_FOLLOWERS.document(self.user.id).collection("user-followers")
        
        followingRef.document(user.id).delete() { (_) in
            followersRef.document(currentUid).delete() { (_) in
                self.isFollowed = false
                completion()
            }
        }
    }
    
    func checkIfUserIsFollowed() {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        let followingRef = COLLECTION_FOLLOWING.document(currentUid).collection("user-following")
        followingRef.document(self.user.id).getDocument { (snapshot, _) in
            guard let isFollowed = snapshot?.exists else { return }
            self.isFollowed = isFollowed
        }
    }
    
    func fetchUserTweets() {
        COLLECTION_TWEETS.whereField("uid", isEqualTo: user.id).getDocuments { (snapshot, _) in
            guard let documents = snapshot?.documents else { return }
            self.userTweets = documents.compactMap({ (documentSnapshot) -> Tweet? in
                try? documentSnapshot.data(as: Tweet.self)
            })
        }
    }
    
    func fetchLikedTweets() {
        var listTweets = [Tweet]()
        let likedTweetsRef = COLLECTION_USERS.document(user.id).collection("user-likes")
        
        likedTweetsRef.getDocuments { (snapshot, _) in
            guard let documents = snapshot?.documents else { return }
            let listTweetsId = documents.map({ $0.documentID })
            
            listTweetsId.forEach { (tweetId) in
                COLLECTION_TWEETS.document(tweetId).getDocument { (snapshot, _) in
                    guard let tweet = try? snapshot?.data(as: Tweet.self) else { return }
                    listTweets.append(tweet)
                    if listTweets.count == listTweetsId.count {
                        self.likedTweets = listTweets
                    }
                }
            }
        }
    }
    
    func tweets(forFilter filter: TweetFilterOptions) -> [Tweet] {
        switch filter {
        case .tweets:
            return userTweets
        case .replies:
            return [Tweet]()
        case .likes:
            return likedTweets
        }
    }
    
}

