//
//  MessageInputView.swift
//  TwitterSwiftUI
//
//  Created by Brendon Bitencourt Braga on 2021-03-25.
//

import SwiftUI

struct MessageInputView: View {
    
    @Binding var messageText: String
    var onSend: () -> Void
    
    var body: some View {
        HStack {
            TextField("Message...", text: $messageText)
                .textFieldStyle(PlainTextFieldStyle())
                .frame(minHeight: 30)
            
            Button(action: onSend, label: {
                Text("Send")
            })
        }
    }
}

struct MessageInputView_Previews: PreviewProvider {
    static var previews: some View {
        MessageInputView(messageText: .constant(""), onSend: {})
    }
}
