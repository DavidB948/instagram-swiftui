//
//  ChatViewModel.swift
//  InstagramSwiftUI
//


import SwiftUI
import FirebaseFirestoreSwift

class ChatViewModel: ObservableObject {
    @Published var text: String = ""
    @Published var messages: [Message] = []
    @AppStorage(wrappedValue: "", CURRENT_USERNAME_KEY) var currentUsername
    
    init() {
        getAllMessages()
    }
    
    func getAllMessages() {
        COLLECTION_MESSAGES.order(by: "timestamp", descending: false).addSnapshotListener { snapshot, error in
            guard error == nil else {
                print("DEBUG: \(String(describing: error?.localizedDescription))")
                return
            }
            guard let snapshot = snapshot else {return}
            snapshot.documentChanges.forEach { [weak self] document in
                if document.type == .added {
                    guard let message = try? document.document.data(as: Message.self) else {return}
                    DispatchQueue.main.async {
                        self?.messages.append(message)
                    }
                }
            }
        }
    }
    
    func sendMessage() {
        guard currentUsername != "" else {return}
        let message = Message(message: text, username: currentUsername, timestamp: Date())
        let _ = try? COLLECTION_MESSAGES.addDocument(from: message) { error in
            guard error == nil else {
                print("DEBUG: \(String(describing: error?.localizedDescription))")
                return
            }
            self.text = ""
        }
    }
}
