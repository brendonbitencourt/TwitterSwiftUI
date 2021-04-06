//
//  TweetActionView.swift
//  TwitterSwiftUI
//
//  Created by Braga, Brendon on 06/04/21.
//

import SwiftUI

struct TweetActionView: View {
    var body: some View {
        HStack {
            Button(action: {}, label: {
                Image(systemName: "bubble.left")
                    .font(.system(size: 16))
                    .frame(width: 32, height: 32)
            })
            
            Spacer()
            
            Button(action: {}, label: {
                Image(systemName: "arrow.2.squarepath")
                    .font(.system(size: 16))
                    .frame(width: 32, height: 32)
            })
            
            Spacer()
            
            Button(action: {}, label: {
                Image(systemName: "heart")
                    .font(.system(size: 16))
                    .frame(width: 32, height: 32)
            })
            
            Spacer()
            
            Button(action: {}, label: {
                Image(systemName: "bookmark")
                    .font(.system(size: 16))
                    .frame(width: 32, height: 32)
            })
            
        }
        .padding(.horizontal)
        .foregroundColor(.gray)
    }
}

struct TweetActionView_Previews: PreviewProvider {
    static var previews: some View {
        TweetActionView()
    }
}
