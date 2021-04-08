//
//  SearchViewModel.swift
//  TwitterSwiftUI
//
//  Created by Braga, Brendon on 01/04/21.
//

import SwiftUI
import Firebase

enum SearhViewModelConfiguration {
    case search
    case newMessage
}

class SearchViewModel: ObservableObject {
    
    @Published var users = [User]()
    private var config: SearhViewModelConfiguration
    
    init(config: SearhViewModelConfiguration) {
        self.config = config
        fetchUsers()
    }
    
    func fetchUsers() {
        COLLECTION_USERS.getDocuments { (snapshot, _) in
            guard let documents = snapshot?.documents else { return }
            let users = documents.compactMap({ (documentSnapshot) -> User? in
                try? documentSnapshot.data(as: User.self)
            })
            
            switch self.config {
            case .search:
                self.users = users
            case .newMessage:
                self.users = users.filter({ !$0.isCurrentUser() })
            }
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
