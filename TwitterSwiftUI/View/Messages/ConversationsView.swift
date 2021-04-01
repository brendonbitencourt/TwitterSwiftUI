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
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            // Navigation
            NavigationLink(
                destination: ChatView(),
                isActive: $showChat,
                label: {}
            )
            
            ScrollView(showsIndicators: false) {
                // LazyVStack
                VStack {
                    ForEach(0..<9) { _ in
                        NavigationLink(
                            destination: ChatView(),
                            label: {
                                ConversationCell()
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
                NewMessageView(show: $isShowingNewMessageView, startChat: $showChat)
                    .environmentObject(SearchViewModel())
            })
        }
    }
}

struct ConversationsView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsView()
    }
}
