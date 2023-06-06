//
//  ProfileActionButtonView.swift
//  InstagramSwiftUI
//


import SwiftUI

struct ProfileActionButtonView: View {
    var isCurrentUser = true
    var isFollowed = false
    
    var body: some View {
        if isCurrentUser {
            //edit profile button
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Edit Profile")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.primary)
                    .frame(width: 360, height: 32)
                    .overlay(
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(Color.gray, lineWidth: 1)
                    )
            })
        } else {
            //follow and message button
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text(isFollowed ? "Following":"Follow")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(isFollowed ? .primary:.white)
                        .frame(width: 172, height: 32)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray, lineWidth: isFollowed ? 1:0)
                        )
                        .background(isFollowed ? Color.clear:Color.blue)
                })
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Message")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.primary)
                        .frame(width: 172, height: 32)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                })
            }
        }
    }
}

struct ProfileActionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProfileActionButtonView()
        }
    }
}
