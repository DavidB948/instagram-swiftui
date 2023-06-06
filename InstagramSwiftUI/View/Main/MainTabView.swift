//
//  MainTabView.swift
//  InstagramSwiftUI
//


import SwiftUI

struct MainTabView: View {
    var body: some View {
        NavigationView {
            TabView {
                FeedView()
                    .tabItem {
                        Image(systemName: "house")
                    }
                
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                    }
                
                UploadPostView()
                    .tabItem {
                        Image(systemName: "plus.square")
                    }
                
                NotificationView()
                    .tabItem {
                        Image(systemName: "heart")
                    }
                
                ProfileView()
                    .tabItem {
                        Image(systemName: "person")
                    }
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: logoutButton, trailing: chatButton)
            .accentColor(.primary)
        }
    }
    
    var logoutButton: some View {
        Button {
            AuthViewModel.shared.signout()
        } label: {
            Text("Logout")
                .foregroundColor(.black)
        }
        
    }
    
    var chatButton: some View {
        NavigationLink(
            destination: ChatView(),
            label: {
                Image(systemName: "message")
                    .foregroundColor(.black)
            })
        //        Button {
        //            print("Message button pressed")
        //        } label: {
        //            Image(systemName: "message")
        //                .foregroundColor(.black)
        //        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
