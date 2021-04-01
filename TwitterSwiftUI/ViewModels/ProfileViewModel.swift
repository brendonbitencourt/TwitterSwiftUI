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
    
}

