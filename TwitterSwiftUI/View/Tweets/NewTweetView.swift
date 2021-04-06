//
//  NewTweetView.swift
//  TwitterSwiftUI
//
//  Created by Brendon Bitencourt Braga on 2021-03-26.
//

import SwiftUI
import Kingfisher

struct NewTweetView: View {
    
    @Binding var isPresented: Bool
    @State var captionText = ""
    @EnvironmentObject var viewModel: UploadTweetViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: .top) {
                    if let user = AuthViewModel.shared.user {
                        KFImage(URL(string: user.profileImageUrl))
                            .resizable()
                            .scaledToFill()
                            .clipped()
                            .frame(width: 64, height: 64)
                            .clipShape(Circle())
                    }
                    
                    TextArea("Whats's happening ?", text: $captionText)
                    
                    Spacer()
                }
                .padding()
                
                Spacer()
            }
            .navigationBarItems(leading: Button(action: {
                self.isPresented.toggle()
            }, label: {
                Text("Cancel")
                    .foregroundColor(.blue)
            }),
            trailing: Button(action: {
                viewModel.uploadTweet(caption: captionText)
            }, label: {
                Text("Tweet")
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
            }))
        }
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView(isPresented: .constant(true))
            .environmentObject(UploadTweetViewModel(isPresented: .constant(true)))
    }
}
