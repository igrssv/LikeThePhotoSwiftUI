//
//  ImageCardView.swift
//  LikeThePhotoSwiftUI
//
//  Created by Игорь Сысоев on 12.03.2023.
//

import SwiftUI

struct ImageCardView: View {
    let image: UIImage?
    private let size = UIScreen.main.bounds.size
    
    private func isImage() -> Image {
        guard let image = image else {
            return Image("plaseholderIMG")
        }
        return Image(uiImage: image)
    }
    
    var body: some View {
        VStack {
            ZStack {
                isImage()
                    .resizable()
                    .frame(width: size.width * 0.9, height: size.height * 0.66)
                    .scaledToFit()
                    .blur(radius: image != nil ? 0 : 5)
                if image == nil {
                    VStack {
                        Text("Loading...")
                            .font(.title3)
                        Text("Check the API key setting")
                            .font(.caption2)
                    }
                }
            }
        }
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}

struct ImageCardView_Previews: PreviewProvider {
    static var previews: some View {
        ImageCardView(image: nil)
    }
}
