//
//  ChatView.swift
//  TwitterSwiftUI
//
//  Created by Brendon Bitencourt Braga on 2021-03-25.
//

import SwiftUI

struct ChatView: View {
    
    @EnvironmentObject var viewModel: ChatViewModel
    @State var messageText: String = ""
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(viewModel.messages) { message in
                        MessageView(message: message)
                    }
                }
            }
            .padding(.top)
            
            MessageInputView(messageText: $messageText, onSend: {
                self.viewModel.sendMessage(messageText)
            })
            .padding()
        }
        .onAppear(perform: {
            viewModel.messages.removeAll()
            viewModel.fetchMessages()
        })
        
        .navigationBarTitle(viewModel.user.fullname)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
            .environmentObject(ChatViewModel(user: MOCK_USER))
    }
}
