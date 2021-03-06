//
//  CustomTextField.swift
//  TwitterSwiftUI
//
//  Created by Brendon Bitencourt Braga on 2021-03-26.
//

import SwiftUI

struct CustomTextField: View {
    
    @Binding var text: String
    
    let placeholder: String
    let imageName: String
    
    init(_ placeholder: String, text: Binding<String>, imageName: String = "") {
        self.placeholder = placeholder
        self._text = text
        self.imageName = imageName
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(Color(.init(white: 1, alpha: 0.87)))
                    .padding(.leading, 40)
            }
            
            HStack(spacing: 16) {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                
                TextField("", text: $text)
            }
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()
            CustomTextField("Email", text: .constant(""))
            Spacer()
        }
        .background(Color.black)
        .ignoresSafeArea()
    }
}
