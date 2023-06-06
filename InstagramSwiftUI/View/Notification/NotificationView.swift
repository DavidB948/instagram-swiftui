//
//  NotificationView.swift
//  InstagramSwiftUI
//


import SwiftUI

struct NotificationView: View {
    var body: some View {
        ScrollView {
            LazyVStack (spacing: 20) {
                ForEach(0 ..< 20) { _ in
                    NotificationCell()
                }
            }
            .padding(.vertical)
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
