//
//  CustomSecureField.swift
//  TwitterSwiftUI
//
//  Created by Brendon Bitencourt Braga on 2021-03-26.
//

import SwiftUI

struct CustomSecureField: View {
    
    @Binding var text: String
    
    let placeholder: String

    init(_ placeholder: String, text: Binding<String>) {
        self.placeholder = placeholder
        self._text = text
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(Color(.init(white: 1, alpha: 0.87)))
                    .padding(.leading, 40)
            }
            
            HStack(spacing: 16) {
                Image(systemName: "lock")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                
                SecureField("", text: $text)
            }
        }
    }
}

struct CustomSecureField_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()
            CustomSecureField("Password", text: .constant(""))
            Spacer()
        }
        .background(Color.black)
        .ignoresSafeArea()
    }
}
