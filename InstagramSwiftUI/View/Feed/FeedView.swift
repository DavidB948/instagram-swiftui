//
//  FeedView.swift
//  InstagramSwiftUI
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 32) {
                ForEach(0 ..< 10) { _ in
                    FeedCell()
                }
            }.padding(.vertical)
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
