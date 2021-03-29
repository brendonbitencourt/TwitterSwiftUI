//
//  AuthViewModel.swift
//  TwitterSwiftUI
//
//  Created by Brendon Bitencourt Braga on 2021-03-29.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var isAutheticating = false
    @Published var error: Error?
    @Published var user: User?
    
    init() {
        userSession = Auth.auth().currentUser
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
        }
    }
    
    func registerUser(email: String, password: String, username: String, fullname: String, profileImage: UIImage) {
        
        guard let imageData = profileImage.jpegData(compressionQuality: 0.3) else { return }
        let fileName = NSUUID().uuidString
        let storageRef = Storage.storage().reference().child(fileName)
        
        storageRef.putData(imageData, metadata: nil) { (_, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            storageRef.downloadURL { (url, _) in
                guard let profileImageUrl = url?.absoluteString else { return }
                
                Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                    if let error = error {
                        print(error.localizedDescription)
                        return
                    }
                    
                    guard let user = result?.user else { return }
                    
                    let data = ["email": email,
                                "username": username,
                                "fullname": fullname,
                                "profileImageUrl": profileImageUrl,
                                "uid": user.uid]
                    
                    Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
                        
                    }
                }
            }
        }
    }
    
    func signOut() {
        userSession = nil
        try? Auth.auth().signOut()
    }
    
}
