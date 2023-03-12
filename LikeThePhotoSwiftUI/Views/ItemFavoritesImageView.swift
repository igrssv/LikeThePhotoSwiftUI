//
//  ItemFavoritesImageView.swift
//  LikeThePhotoSwiftUI
//
//  Created by Игорь Сысоев on 12.03.2023.
//

import SwiftUI

struct ItemFavoritesImageView: View {
    let image: UIImage
//    let image: String
    private let size = UIScreen.main.bounds.size
    
    var body: some View {
        VStack {
            Image(uiImage: image)
                .resizable()
                .frame(width: size.width * 0.3, height: size.height * 0.2 )
                .scaledToFill()
                .cornerRadius(10)
        }
    }
}

struct ItemFavoritesImageView_Previews: PreviewProvider {
    static var previews: some View {
        ItemFavoritesImageView(image: UIImage(named: "plaseholderIMG")!)
//        ItemFavoritesImageView(image: "plaseholderIMG")

    }
}
