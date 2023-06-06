//
//  AuthViewModel.swift
//  InstagramSwiftUI
//


import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User? {
        didSet {
            fetchUsername()
        }
    }
    @AppStorage(wrappedValue: "", CURRENT_USERNAME_KEY) var currentUsername
    static let shared = AuthViewModel()
    
    init() {
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Login failed with error \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else {return}
            self.userSession = user
        }
    }
    
    func register(withEmail email: String, password: String,
                  image: UIImage?, fullname: String, username: String) {
        guard let image = image else {return}
        
        ImageUploader.uploadImage(image: image) { imageURL in
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let error = error {
                    print(error.localizedDescription); return
                }
                
                guard let user = result?.user else {return}
                print("Succesfully registered user \(String(describing: self.userSession))")
                
                let data = ["email": email, "username": username, "fullname": fullname, "profileImageURL": imageURL, "uid": user.uid]
                COLLECTION_USERS.document(user.uid).setData(data) { _ in
                    print("Successfully uploaded user data...")
                    self.userSession = user
                }
            }
            
        }
        
    }
    
    func signout() {
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    
    func resetPassword() {
        
    }
    
    func fetchUsername() {
        guard let uid = userSession?.uid else {return}
        COLLECTION_USERS.document(uid).getDocument { [weak self] snapshot, _ in
            guard let user = try? snapshot?.data(as: User.self) else {return}
            //print(user.username)
            self?.currentUsername = user.username
        }
    }
    
    func fetchUser()  {
        guard let uid = userSession?.uid else {return}
        
        COLLECTION_USERS.document(uid).getDocument { snapshot, _ in
            guard let user = try? snapshot?.data(as: User.self) else {return}
            print(user.email)
            
        }
    }
}
