//
//  ProfileActionButtonView.swift
//  TwitterSwiftUI
//
//  Created by Brendon Bitencourt Braga on 2021-03-25.
//

import SwiftUI

struct ProfileActionButtonView: View {
    
    @EnvironmentObject var viewModel: ProfileViewModel
    @State private var isLoading: Bool = false
    
    var body: some View {
        
        if viewModel.user.isCurrentUser() {
            Button(action: {}, label: {
                Text("Edit profile")
                    .frame(width: 360, height: 40)
                    .background(Color.blue)
                    .foregroundColor(.white)
            })
            .cornerRadius(20)
        } else {
            HStack(spacing: 10) {
                Button(action: {
                    viewModel.user.isFollowed ? unfollow() : follow()
                }, label: {
                    Group {
                        if isLoading {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
                                .frame(width: 180, height: 40)
                                .background(Color.blue)
                                .foregroundColor(.white)
                        } else {
                            Text(viewModel.user.isFollowed ? "Following" : "Follow")
                                .frame(width: 180, height: 40)
                                .background(Color.blue)
                                .foregroundColor(.white)
                        }
                    }
                })
                .cornerRadius(20)
                
                NavigationLink(
                    destination: ChatView(user: viewModel.user),
                    label: {
                        Text("Message")
                            .frame(width: 180, height: 40)
                            .background(Color.purple)
                            .foregroundColor(.white)
                    })
                    .cornerRadius(20)
            }
        }
    }
    
    private func follow() {
        isLoading = true
        viewModel.follow {
            isLoading = false
        }
    }
    
    private func unfollow() {
        isLoading = true
        viewModel.unfollow {
            isLoading = false
        }
    }
}

struct ProfileActionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileActionButtonView()
            .environmentObject(ProfileViewModel(user: MOCK_USER))
    }
}
