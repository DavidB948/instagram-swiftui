//
//  User.swift
//  InstagramSwiftUI
//


import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    let username: String
    let email: String
    let profileImageURL: String
    let fullname: String
    @DocumentID var id: String?
}
