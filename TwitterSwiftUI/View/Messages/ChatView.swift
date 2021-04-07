//
//  ChatView.swift
//  TwitterSwiftUI
//
//  Created by Brendon Bitencourt Braga on 2021-03-25.
//

import SwiftUI

struct ChatView: View {
    
    @State var messageText: String = ""
    let user: User
    let viewModel: ChatViewModel
    
    init(user: User) {
        self.user = user
        self.viewModel = ChatViewModel(user: user)
    }
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(MOCK_MESSAGES) { message in
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
        
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(user: MOCK_USER)
    }
}
