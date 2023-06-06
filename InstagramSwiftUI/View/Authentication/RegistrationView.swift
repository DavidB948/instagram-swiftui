//
//  RegistrationView.swift
//  InstagramSwiftUI
//

import SwiftUI

struct RegistrationView: View {
    //image picker
    @State private var selectedImage: UIImage?
    @State private var image: Image?
    @State private var imagePickerPresented = false
    //user details
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var password = ""
    @Environment (\.presentationMode) var mode
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.pink, .purple]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                if let image = image {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 140, height: 140)
                        .clipShape(Circle())
                        .padding()
                } else {
                    Button(action: {imagePickerPresented.toggle()}, label: {
                        PlusPhotoView(padding: 40, font: .title2)
                            .foregroundColor(.white)
                            .frame(width: 140, height: 140)
                    })
                    .padding()
                    .sheet(isPresented: $imagePickerPresented, onDismiss: loadImage, content: {
                        ImagePicker(image: $selectedImage )
                    })
                }
                
                VStack(spacing: 15) {
                    //email
                    CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                    
                    //username
                    CustomTextField(text: $username, placeholder: Text("Username"), imageName: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                    
                    //fullname
                    CustomTextField(text: $fullname, placeholder: Text("Full Name"), imageName: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                    //pass
                    CustomSecureField(text: $password, placeholder: Text("Password"))
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)

                    //sign up
                    Button(action: {
                        viewModel.register(withEmail: email, password: password, image: selectedImage, fullname: fullname, username: username)
                    }, label: {
                        Text("Sign Up")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 45)
                            //.frame(width: 310, height: 43)
                            .background(Color(#colorLiteral(red: 0.5637792471, green: 0.302904917, blue: 1, alpha: 1)))
                            .clipShape(Capsule())
                            .padding(.top, 20)
                            .padding(.horizontal, 32)
                    })
                    
                }
                
                Spacer()
                //go back to login page
                Button(
                    action: {mode.wrappedValue.dismiss()},
                    label: {
                        HStack {
                            Text("Already have an account?")
                                .font(.system(size: 14))
                            Text("Sign in")
                                .font(.system(size: 14, weight: .semibold))
                        }
                        .foregroundColor(.white)
                    }).padding(.bottom)
            }
        }
    }
}

extension RegistrationView {
    func loadImage() {
        guard let selectedImage = selectedImage else {return}
        image = Image(uiImage: selectedImage)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
