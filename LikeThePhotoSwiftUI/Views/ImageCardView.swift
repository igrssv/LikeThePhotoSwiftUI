//
//  ImageCardView.swift
//  LikeThePhotoSwiftUI
//
//  Created by Игорь Сысоев on 12.03.2023.
//

import SwiftUI

struct ImageCardView: View {
    let image: String
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .scaledToFit()
        }
        .cornerRadius(20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .shadow(radius: 10)
    }
}

struct ImageCardView_Previews: PreviewProvider {
    static var previews: some View {
        ImageCardView(image: "demoIMG")
    }
}
