//
//  SearchViewModel.swift
//  TwitterSwiftUI
//
//  Created by Braga, Brendon on 01/04/21.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

class SearchViewModel: ObservableObject {
    
    @Published var users = [User]()
    
    init(withMOCK: Bool = false) {
        if !withMOCK {
            fetchUsers()
        } else {
            self.users = MOCK_USERS
        }
    }
    
    func fetchUsers() {
        COLLECTION_USERS.getDocuments { (snapshot, _) in
            guard let documents = snapshot?.documents else { return }
            self.users = documents.compactMap({ (documentSnapshot) -> User? in
                try? documentSnapshot.data(as: User.self)
            })
        }
    }
    
    func filteredUsers(_ query: String) -> [User] {
        let lowerCaseQuery = query.lowercased()
        return users.filter { (user) -> Bool in
            let fullname = user.fullname.lowercased().contains(lowerCaseQuery)
            let username = user.username.contains(lowerCaseQuery)
            return fullname || username
        }
    }
    
}
