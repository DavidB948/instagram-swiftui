//
//  ProfileHeaderView.swift
//  InstagramSwiftUI
//


import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("joker")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .padding(.leading)
                Spacer()
                HStack(spacing: 16) {
                    UserStateView(value: 1, title: "Posts")
                    UserStateView(value: 2, title: "Followers")
                    UserStateView(value: 3, title: "Following")
                }
                Spacer()
            }
            
            Text("Crazy Guy")
                .font(.system(size: 15, weight: .semibold))
                .padding([.top, .leading])
            
            Text("Gotham's villain || Diabolical genius")
                .font(.system(size: 15))
                .padding(.leading)
                .padding(.top, 1)
            
            HStack {
                Spacer()
                ProfileActionButtonView()
                Spacer()
            }
            .padding(.vertical)
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}
