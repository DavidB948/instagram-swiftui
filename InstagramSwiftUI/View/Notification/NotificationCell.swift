//
//  NotificationCell.swift
//  InstagramSwiftUI
//


import SwiftUI

struct NotificationCell: View {
    @State private var showPostImage = false
    
    var body: some View {
        HStack {
            Image("joker")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
            Text("Joker").font(.system(size: 14, weight: .semibold)) +
                Text(" liked one of your post")
                .font(.system(size: 15))
            
            Spacer()
            
            if showPostImage {
                Image("joker")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
            } else {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("follow")
                        .padding(.horizontal, 20)
                        .padding(.vertical, 4)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        .font(.system(size: 14, weight: .semibold))
                })
            }
        }
        .padding(.horizontal)
    }
}

struct NotificationCell_Previews: PreviewProvider {
    static var previews: some View {
        NotificationCell()
    }
}
