//
//  PlusPhotoView.swift
//  InstagramSwiftUI
//


import SwiftUI

struct PlusPhotoView: View {
    var padding: CGFloat = 55
    var font: Font = .largeTitle
    
    var body: some View {
        VStack (spacing: 17) {
            Image(systemName: "plus")
            Text("Photo")
        }
        .font(font)
        .padding(padding)
        .overlay(
            Circle()
                .stroke(lineWidth: 3)
            
        )
        
    }
}

struct PlusPhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PlusPhotoView()
    }
}
