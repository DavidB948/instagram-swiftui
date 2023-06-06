//
//  ChatBubble.swift
//  InstagramSwiftUI
//

import SwiftUI

struct ChatBubble: Shape {
    let currentUser: Bool
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight, currentUser ? .bottomLeft : .bottomRight], cornerRadii: CGSize(width: 15, height: 15))
        return Path(path.cgPath)
    }
}


