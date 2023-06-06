//
//  ProfileView.swift
//  InstagramSwiftUI
//


import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ProfileHeaderView()
                PostGridView()
            }
            .padding(.vertical)
        }
       
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
