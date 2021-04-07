//
//  UserProfileView.swift
//  TwitterSwiftUI
//
//  Created by Brendon Bitencourt Braga on 2021-03-25.
//

import SwiftUI

struct UserProfileView: View {
    
    @EnvironmentObject var viewModel: ProfileViewModel
    @State var selectedFilter: TweetFilterOptions = .tweets
    
    var body: some View {
        ScrollView {
            VStack {
                ProfileHeaderView()
                    .environmentObject(viewModel)
                    .padding()
                
                FilterButtonView(selectedOption: $selectedFilter)
                    .padding()
                
                ForEach(viewModel.tweets(forFilter: selectedFilter)) { tweet in
                    TweetCell(tweet: tweet)
                        .padding(.horizontal)
                }
            }
            
            Spacer()
        }
        .navigationTitle("@\(viewModel.user.username)")
        .onAppear(perform: {
            viewModel.fetchUserTweets()
            viewModel.fetchLikedTweets()
            viewModel.fetchUserStats()
        })
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
            .environmentObject(ProfileViewModel(user: MOCK_USER))
    }
}
