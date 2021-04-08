//
//  ConversationsView.swift
//  TwitterSwiftUI
//
//  Created by Brendon Bitencourt Braga on 2021-03-25.
//

import SwiftUI

struct ConversationsView: View {
    
    @State private var isShowingNewMessageView = false
    @State private var showChat = false
    @State private var user: User?
    @EnvironmentObject var viewModel: ConversationsViewModel
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            // Navigation
            if let user = user {
                NavigationLink(
                    destination: ChatView()
                        .environmentObject(ChatViewModel(user: user)),
                    isActive: $showChat,
                    label: {}
                )
            }
            
            ScrollView(showsIndicators: false) {
                // LazyVStack
                VStack {
                    ForEach(viewModel.recentMessages) { message in
                        NavigationLink(
                            destination: ChatView()
                                .environmentObject(ChatViewModel(user: message.user!)),
                            label: {
                                ConversationCell(message: message)
                            })
                    }
                }
                .padding(.top)
            }
            
            Button(action: {
                self.isShowingNewMessageView.toggle()
            }, label: {
                Image(systemName: "envelope")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding()
            })
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .sheet(isPresented: $isShowingNewMessageView, content: {
                NewMessageView(show: $isShowingNewMessageView, startChat: $showChat, user: $user)
                    .environmentObject(SearchViewModel(config: .newMessage))
            })
        }
    }
}

struct ConversationsView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsView()
            .environmentObject(ConversationsViewModel())
    }
}
