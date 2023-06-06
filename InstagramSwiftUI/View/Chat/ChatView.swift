//
//  ChatView.swift
//  InstagramSwiftUI
//

import SwiftUI

struct ChatView: View {
    @StateObject var chatViewModel = ChatViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollViewReader { proxy in
                ScrollView {
                    VStack(spacing: 15) {
                        ForEach(chatViewModel.messages) { message in
                            ChatCell(chatData: message)
                                .onAppear{
                                    //Scroll to bottom
                                    if message.id == chatViewModel.messages.last!.id {
                                        proxy.scrollTo(chatViewModel.messages.last!.id, anchor: .bottom)
                                    }
                                }
                        }
                    }
                }
                .padding(.vertical)
            }
            
            HStack(spacing: 15) {
                TextField("Enter Message", text: $chatViewModel.text)
                    .padding(.horizontal)
                    .frame(height: 45)
                    .background(Color.gray.opacity(0.6))
                    .clipShape(Capsule())
                
                if chatViewModel.text != "" {
                    Button(action: chatViewModel.sendMessage,
                           label: {
                            Image(systemName: "paperplane.fill")
                                .font(.system(size: 22))
                                .foregroundColor(.white)
                                .frame(width: 45, height: 45)
                                .background(Color("Color"))
                                .clipShape(Circle())
                           })
                    
                }
            }
            .animation(.default)
            .padding(10)
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
