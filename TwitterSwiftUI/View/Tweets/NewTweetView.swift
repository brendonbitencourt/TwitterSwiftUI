//
//  NewTweetView.swift
//  TwitterSwiftUI
//
//  Created by Brendon Bitencourt Braga on 2021-03-26.
//

import SwiftUI

struct NewTweetView: View {
    
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Image("batman")
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .frame(width: 64, height: 64)
                        .clipShape(Circle())
                    
                    Text("Whats's happening ?")
                        .foregroundColor(.gray)
                    
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
            trailing: Button(action: {}, label: {
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
    }
}
