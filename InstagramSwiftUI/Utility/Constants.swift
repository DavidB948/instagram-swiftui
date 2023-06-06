//
//  Constants.swift
//  InstagramSwiftUI
//


import Firebase

let USERS_KEY = "users"
let MESSAGES_KEY = "messages"
let CURRENT_USERNAME_KEY = "currentUsername"
let COLLECTION_USERS = Firestore.firestore().collection(USERS_KEY)
let COLLECTION_MESSAGES = Firestore.firestore().collection(MESSAGES_KEY)

