//
//  FavoritesView.swift
//  LikeThePhotoSwiftUI
//
//  Created by Игорь Сысоев on 12.03.2023.
//

import SwiftUI

struct FavoritesView: View {
    @StateObject private var vm = FavoritesViewModel()

//    let images = ["demo1", "demo2", "demo3", "demo4"]

    private let grids = [
        GridItem(),
        GridItem(),
        GridItem()
    ]
    var body: some View {
        NavigationView {
            VStack {
                if vm.images.isEmpty {
                    Text("No images saved")
                } else {
                    ScrollView {
                        LazyVGrid(columns: grids) {
                            ForEach(vm.images, id: \.self) { image in
                                ItemFavoritesImageView(image: image)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .navigationTitle("Favorites")
        }
        .onAppear {
            vm.loadImage()
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
