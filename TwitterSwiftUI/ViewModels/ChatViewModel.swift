//
//  ChatViewModel.swift
//  TwitterSwiftUI
//
//  Created by Braga, Brendon on 07/04/21.
//

import SwiftUI
import Firebase

struct ChatViewModel {
    
    let user: User
    
    init(user: User) {
        self.user = user
    }
    
    func fetchMessage() {
        
    }
    
    func sendMessage(_ message: String) {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let currentUserRef = COLLECTION_MESSAGES.document(currentUid).collection(user.id).document()
        let receivingUserRef = COLLECTION_MESSAGES.document(user.id).collection(currentUid)
        let currentRecentRef = COLLECTION_MESSAGES.document(currentUid).collection("recent-messages")
        let receivingRecentRef = COLLECTION_MESSAGES.document(user.id).collection("recent-messages")
        let messageId = currentUserRef.documentID
        
        let data: [String : Any] = ["text": message,
                    "id": messageId,
                    "fromId": currentUid,
                    "toId": user.id,
                    "timestamp": Timestamp(date: Date())]
        
        currentUserRef.setData(data)
        receivingUserRef.document(messageId).setData(data)
        
        currentRecentRef.document(user.id).setData(data)
        receivingRecentRef.document(currentUid).setData(data)
    }
    
}
