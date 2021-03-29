//
//  RegistrationView.swift
//  TwitterSwiftUI
//
//  Created by Brendon Bitencourt Braga on 2021-03-26.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var fullName: String = ""
    @State private var userName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    
    @State private var showImagePicker = false
    @State private var selectedUIImage: UIImage?
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        ZStack {
            VStack {
                Button(action: {
                    showImagePicker.toggle()
                }, label: {
                    if let image = selectedUIImage {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 140, height: 140)
                            .clipped()
                            .clipShape(Circle())
                    } else {
                        Image("plus_photo")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(.white)
                            .scaledToFill()
                            .frame(width: 140, height: 140)
                        
                    }
                })
                .padding(.top, 88)
                .padding(.bottom)
                .sheet(isPresented: $showImagePicker) {
                    ImagePicker(sourceType: .photoLibrary) { (image) in
                        self.selectedUIImage = image
                    }
                }
                
                VStack {
                    CustomTextField("Full Name", text: $fullName, imageName: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                    CustomTextField("Username", text: $userName, imageName: "person.fill")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
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
                
                Button(action: {
                    guard let selectedUIImage = selectedUIImage else { return }
                    viewModel.registerUser(email: email, password: password, username: userName, fullname: fullName, profileImage: selectedUIImage)
                }, label: {
                    Text("Sign up")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .frame(width: 360, height: 50)
                        .background(Color.white)
                        .clipShape(Capsule())
                })
                .padding(.top)
                
                Spacer()
            }
            .padding(.horizontal, 32)
        }
        .background(Color(#colorLiteral(red: 0.1184234694, green: 0.6316044927, blue: 0.951161921, alpha: 1)))
        .ignoresSafeArea()
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
            .environmentObject(AuthViewModel())
    }
}
