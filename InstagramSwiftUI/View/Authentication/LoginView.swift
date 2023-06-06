//
//  LoginView.swift
//  InstagramSwiftUI
//


import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.pink, .purple]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack {
                    //logo
                    Text("Instagram")
                        .bold()
                        .font(.system(size: 40))
                        .font(.system(.largeTitle, design: .rounded))
                        .foregroundColor(.white)
                        .frame(width: 220, height: 100)
                    VStack(spacing: 15) {
                        //email
                        CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
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
                        //forgot password
                        HStack {
                            Spacer()
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Text("Forgot Password?")
                                    .font(.system(size: 13, weight: .semibold))
                                    .foregroundColor(.white)
                                    .padding(.top, 5)
                                    .padding(.trailing, 29)
                                
                            })
                        }
                        //sign in
                        Button(action: {
                            viewModel.login(withEmail: email, password: password)
                        }, label: {
                            Text("Sign in")
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
                    //go to sign up
                    NavigationLink(
                        destination: RegistrationView()
                            .navigationBarHidden(true),
                        label: {
                            HStack {
                                Text("Don't have an account?")
                                    .font(.system(size: 14))
                                Text("Sign up")
                                    .font(.system(size: 14, weight: .semibold))
                            }
                            .foregroundColor(.white)
                        }).padding(.bottom)
                }
                .padding(.top, -50)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
