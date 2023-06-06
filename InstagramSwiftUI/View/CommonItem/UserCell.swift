//
//  UserCell.swift
//  InstagramSwiftUI
//


import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            //Image
            Image("joker")
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
            
            //Vstack of username and fullname
            VStack(alignment: .leading) {
                Text("Joker")
                    .font(.system(size: 14, weight: .semibold))
                
                Text("Crazy Guy")
                    .font(.system(size: 14))
            }
            
            Spacer()
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
