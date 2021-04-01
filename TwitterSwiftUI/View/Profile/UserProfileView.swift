//
//  UserProfileView.swift
//  TwitterSwiftUI
//
//  Created by Brendon Bitencourt Braga on 2021-03-25.
//

import SwiftUI

struct UserProfileView: View {
    
    @EnvironmentObject var viewModel: ProfileViewModel
    @State var selectedFilter: TwittFilterOptions = .tweets
    
    var body: some View {
        ScrollView {
            VStack {
                ProfileHeaderView()
                    .environmentObject(viewModel)
                    .padding()
                
                FilterButtonView(selectedOption: $selectedFilter)
                    .padding()
                
                ForEach(0..<9) { _ in
                    TweetCell()
                        .padding(.horizontal)
                }
            }
            
            .navigationTitle("@\(viewModel.user.username)")
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
            .environmentObject(ProfileViewModel(user: MOCK_USER))
    }
}
