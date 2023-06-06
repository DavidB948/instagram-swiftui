//
//  UserLIstView.swift
//  InstagramSwiftUI
//


import SwiftUI

struct UserListView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0 ..< 20) { _ in
                    NavigationLink(
                        destination: ProfileView(),
                        label: {
                            UserCell()
                                .padding(.leading)
                        })
                }
            }
        }
    }
}

struct UserLIstView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
