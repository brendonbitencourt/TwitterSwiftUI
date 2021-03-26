//
//  LoginView.swift
//  TwitterSwiftUI
//
//  Created by Brendon Bitencourt Braga on 2021-03-26.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack {
            VStack {
                Image("twitter-logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 220, height: 100)
                    .padding(.top, 88)
                    .padding(.bottom)
                
                VStack {
                    CustomTextField("Email", text: $email, imageName: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                    CustomSecureField("Password", text: $password)
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
                .padding(.vertical)
                
                HStack {
                    Spacer()
                    
                    Button(action: {}, label: {
                        Text("Forgot password?")
                            .font(.footnote)
                            .foregroundColor(.white)
                            .bold()
                    })
                }
                
                Button(action: {}, label: {
                    Text("Sign in")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .frame(width: 360, height: 50)
                        .background(Color.white)
                        .clipShape(Capsule())
                })
                .padding(.top)
                
                Spacer()
                
                HStack {
                    Text("Don't have an account?")
                    
                    Button(action: {}, label: {
                        Text("Sign up")
                            .bold()
                    })
                }
                .padding(.bottom, 32)
                .foregroundColor(.white)
            }
            .padding(.horizontal, 32)
        }
        .background(Color(#colorLiteral(red: 0.1184234694, green: 0.6316044927, blue: 0.951161921, alpha: 1)))
        .ignoresSafeArea()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
