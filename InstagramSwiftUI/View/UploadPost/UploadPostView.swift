//
//  UploadPostView.swift
//  InstagramSwiftUI
//


import SwiftUI

struct UploadPostView: View {
    @State private var selectedImage: UIImage?
    @State private var postImage: Image?
    @State private var captionText = ""
    @State private var imagePickerPresented = false
    
    var body: some View {
        VStack {
            if postImage == nil {
                Button(action: {
                    imagePickerPresented.toggle()
                }, label: {
                    PlusPhotoView()
                        .foregroundColor(.primary)
                })
                .padding(.top, 100)
                .sheet(isPresented: $imagePickerPresented, onDismiss: loadImage, content: {
                    ImagePicker(image: $selectedImage )
                })
            } else if let image = postImage {
                HStack(alignment: .top, spacing: 10) {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 96, height: 96)
                        .clipped()
                    TextField("Enter your caption...", text: $captionText)
                        .padding(.top, 4)
                }
                .padding()
                
                Button(action: {
                    
                }, label: {
                    Text("Share")
                        .font(.system(size: 16, weight: .semibold))
                        .frame(width: 360, height: 50)
                        .background(Color.blue)
                        .cornerRadius(5)
                        .foregroundColor(.white)
                })
                .padding()
            }
            Spacer()
        }
            
    }
}

extension UploadPostView {
    func loadImage() {
        guard let selectedImage = selectedImage else {return}
        postImage = Image(uiImage: selectedImage)
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView()
    }
}
