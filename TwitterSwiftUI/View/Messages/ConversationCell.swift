//
//  ConversationCell.swift
//  TwitterSwiftUI
//
//  Created by Brendon Bitencourt Braga on 2021-03-25.
//

import SwiftUI

struct ConversationCell: View {
    var body: some View {
        VStack {
            HStack(spacing: 12) {
                Image("batman")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 56, height: 56)
                    .clipShape(Circle())
            
                VStack(alignment: .leading, spacing: 4) {
                    Text("batman")
                        .font(.system(size: 14, weight: .semibold))
                    Text("Longer messages text to see what happends when I do this")
                        .font(.system(size: 14))
                        .fixedSize(horizontal: false, vertical: true)
                }
                .foregroundColor(.black)
                .padding(.trailing)
            }
            
            Divider()
        }
    }
}

struct ConversationCell_Previews: PreviewProvider {
    static var previews: some View {
        ConversationCell()
    }
}
