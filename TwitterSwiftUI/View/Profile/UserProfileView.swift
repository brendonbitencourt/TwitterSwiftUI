//
//  UserProfileView.swift
//  TwitterSwiftUI
//
//  Created by Brendon Bitencourt Braga on 2021-03-25.
//

import SwiftUI

struct UserProfileView: View {
    var body: some View {
        ScrollView {
            VStack {
                ProfileHeaderView()
                    .padding()
            }
            
            .navigationTitle("@batman")
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
