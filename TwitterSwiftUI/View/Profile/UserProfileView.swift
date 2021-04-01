//
//  UserProfileView.swift
//  TwitterSwiftUI
//
//  Created by Brendon Bitencourt Braga on 2021-03-25.
//

import SwiftUI

struct UserProfileView: View {
    
    @State var selectedFilter: TwittFilterOptions = .tweets
    let user: User
    
    var body: some View {
        ScrollView {
            VStack {
                ProfileHeaderView(user: user)
                    .padding()
                
                FilterButtonView(selectedOption: $selectedFilter)
                    .padding()
                
                ForEach(0..<9) { _ in
                    TweetCell()
                        .padding(.horizontal)
                }
            }
            
            .navigationTitle("@\(user.username)")
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView(user: MOCK_USER)
    }
}
