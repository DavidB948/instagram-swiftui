//
//  UserStateView.swift
//  InstagramSwiftUI
//


import SwiftUI

struct UserStateView: View {
    let value: Int
    let title: String
    var body: some View {
        VStack {
            Text("\(value)")
                .font(.system(size: 15, weight: .semibold))
            
            Text(title)
                .font(.system(size: 15))
        }
        .frame(alignment: .center)
    }
}

struct UserStateView_Previews: PreviewProvider {
    static var previews: some View {
        UserStateView(value: 2, title: "Followers")
    }
}
