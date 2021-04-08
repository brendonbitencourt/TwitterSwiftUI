//
//  ConversationCell.swift
//  TwitterSwiftUI
//
//  Created by Brendon Bitencourt Braga on 2021-03-25.
//

import SwiftUI
import Kingfisher

struct ConversationCell: View {
    
    let message: Message
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 12) {
                KFImage(URL(string: message.user?.profileImageUrl ?? ""))
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 56, height: 56)
                    .clipShape(Circle())
            
                VStack(alignment: .leading, spacing: 4) {
                    Text(message.user?.fullname ?? "") 
                        .font(.system(size: 14, weight: .semibold))
                    Text(message.text)
                        .font(.system(size: 14))
                        .fixedSize(horizontal: false, vertical: true)
                }
                .foregroundColor(.black)
                .padding(.trailing)
            }
            .padding(.horizontal,  8)
            
            Divider()
        }
    }
}

struct ConversationCell_Previews: PreviewProvider {
    static var previews: some View {
        ConversationCell(message: MOCK_MESSAGE)
    }
}
