//
//  Message.swift
//  InstagramSwiftUI
//

import Foundation
import FirebaseFirestoreSwift

struct Message: Codable, Identifiable, Hashable {
    
    let message: String
    let username: String
    let timestamp: Date
    @DocumentID var id: String?
    
}
