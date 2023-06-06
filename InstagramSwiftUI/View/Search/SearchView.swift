//
//  SearchView.swift
//  InstagramSwiftUI
//


import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @State private var inSearchMode = false
    
    var body: some View {
        ScrollView {
            //search bar
            SearchBar(text: $searchText, isEditing: $inSearchMode)
                .padding()
            //grid view
            ZStack {
                if inSearchMode {
                    UserListView()
                } else {
                    PostGridView()
                }
            }
            .animation(.default)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
