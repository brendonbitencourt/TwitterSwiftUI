//
//  TwitterSwiftUIApp.swift
//  TwitterSwiftUI
//
//  Created by Brendon Bitencourt Braga on 2021-03-24.
//

import SwiftUI
import Firebase

@main
struct TwitterSwiftUIApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AuthViewModel())
        }
    }
}
