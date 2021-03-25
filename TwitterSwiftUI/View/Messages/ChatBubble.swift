//
//  ChatBubble.swift
//  TwitterSwiftUI
//
//  Created by Brendon Bitencourt Braga on 2021-03-25.
//

import SwiftUI

struct ChatBubble: Shape {
    
    var isFromCurrentUser: Bool
    
    func path(in rect: CGRect) -> Path {
        let roundaingCorners: UIRectCorner =  [
            .topLeft, .topRight, (isFromCurrentUser ? .bottomLeft : .bottomRight)
        ]
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: roundaingCorners, cornerRadii:CGSize(width: 16, height: 16))
        return Path(path.cgPath)
    }
}

struct ChatBubble_Previews: PreviewProvider {
    static var previews: some View {
        ChatBubble(isFromCurrentUser: false)
    }
}
