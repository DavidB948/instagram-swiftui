//
//  ChatCell.swift
//  InstagramSwiftUI
//

import SwiftUI

struct ChatCell: View {
    @AppStorage(wrappedValue: "", CURRENT_USERNAME_KEY) var currentUsername
    var chatData: Message
    var body: some View {
        HStack(spacing: 15) {
            if chatData.username != currentUsername {
                Initial(name: chatData.username)
            } else {
                Spacer(minLength: 0)
            }
            VStack(alignment: chatData.username == currentUsername ? .trailing : .leading, spacing: 5) {
                Text(chatData.message)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color("Color"))
                    .clipShape(ChatBubble(currentUser: chatData.username == currentUsername))
                
                Text(chatData.timestamp, style: .time)
                    .font(.caption2)
                    .foregroundColor(.gray)
                    .padding(chatData.username != currentUsername ? .leading:.trailing, 10)
            }
            if chatData.username == currentUsername {
                Initial(name: chatData.username)
            } else {
                Spacer(minLength: 0)
            }
        }
        .padding()
    }
}

struct Initial: View {
    @AppStorage(wrappedValue: "", CURRENT_USERNAME_KEY) var currentUsername
    var name: String
    var body: some View {
        Text(String(name.first ?? "-"))
            .fontWeight(.heavy)
            .foregroundColor(.white)
            .frame(width: 50, height: 50, alignment: .center)
            .background((name == currentUsername ? Color.blue   : Color.green).opacity(0.5))
            .clipShape(Circle())
            //Context menu for overlay display of username when long press on initial icon
            .contentShape(Circle())
            .contextMenu{
                Text(name)
                    .fontWeight(.bold)
            }
    }
}

//struct ChatCell_Previews: PreviewProvider {
//    static var previews: some View {
//        ChatCell(chatData: Message(message: "sth", username: "Joker", timestamp: Date(timeIntervalSinceNow: 0), id: "hashdadasdads"))
//            .environmentObject(AuthViewModel.shared)
//    }
//}
