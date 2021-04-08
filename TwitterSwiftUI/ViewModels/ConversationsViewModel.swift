//
//  ConversationsViewModel.swift
//  TwitterSwiftUI
//
//  Created by Braga, Brendon on 08/04/21.
//

import SwiftUI
import Firebase

class ConversationsViewModel: ObservableObject {
    
    @Published var recentMessages = [Message]()
    private var reccentMessagesDictionary = [String: Message]()
    
    init() {
        fetchRecentMessage()
    }
    
    func fetchRecentMessage() {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        let currentRecentRef = COLLECTION_MESSAGES.document(currentUid).collection("recent-messages")
        currentRecentRef.order(by: "timestamp", descending: true)
        
        currentRecentRef.addSnapshotListener { (snapshot, _) in
            guard let documents = snapshot?.documentChanges else { return }
            documents.forEach { (snapshotRecent) in
                let uid = snapshotRecent.document.documentID
                if var message = try? snapshotRecent.document.data(as: Message.self) {
                    COLLECTION_USERS.document(uid).getDocument { (snapshotUser, _) in
                        if let user = try? snapshotUser?.data(as: User.self) {
                            message.user = user
                            self.reccentMessagesDictionary[uid] = message
                            self.recentMessages = Array(self.reccentMessagesDictionary.values)
                        }
                    }
                }
            }
        }
    }
    
}
