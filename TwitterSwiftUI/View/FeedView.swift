//
//  FeedView.swift
//  TwitterSwiftUI
//
//  Created by Brendon Bitencourt Braga on 2021-03-24.
//

import SwiftUI

struct FeedView: View {
    
    @State private var isShowingNewTweetView = false
    @EnvironmentObject var viewModel: FeedViewModel
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView(showsIndicators: false) {
                // LazyVStack
                VStack {
                    ForEach(viewModel.tweets) { (tweet) in
                        NavigationLink(
                            destination: TweetDetailView(tweet: tweet),
                            label: {
                                TweetCell(tweet: tweet)
                            })
                    }
                }
                .padding(.top)
            }
            
            Button(action: {
                self.isShowingNewTweetView.toggle()
            }, label: {
                Image("tweet")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 32, height: 32)
                    .padding()
            })
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .fullScreenCover(isPresented: $isShowingNewTweetView) {
                NewTweetView(isPresented: $isShowingNewTweetView)
                    .environmentObject(UploadTweetViewModel(isPresented: $isShowingNewTweetView))
            }
            
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
            .environmentObject(FeedViewModel(withMOCK: true))
    }
}
