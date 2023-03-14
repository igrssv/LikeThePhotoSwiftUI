//
//  ImageFullScreenView.swift
//  LikeThePhotoSwiftUI
//
//  Created by Игорь Сысоев on 12.03.2023.
//

import SwiftUI

struct ImageFullScreenView: View {
    @EnvironmentObject var vm: FavoritesViewModel
    let image: UIImage
    @State private var navigations = true
    @GestureState private var scale: CGFloat = 1
    
    private var magnificator: some Gesture {
        MagnificationGesture()
            .updating($scale) { current, gestureState, _ in
                gestureState = current
            }
    }
    private func showNavigation() {
        withAnimation {
            navigations.toggle()
        }
    }
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack {
                Color.black.ignoresSafeArea()
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .scaleEffect(scale)
                    .gesture(magnificator)
                    .onTapGesture {
                        showNavigation()
                    }
            }
            if navigations {
                HStack {
                    ShareLink(
                        item: Image(uiImage: image),
                        preview: SharePreview(
                            "LikeThePhoto",
                            image: Image(uiImage: image)
                        )
                    ) {
                        Image(systemName: "square.and.arrow.up")
                            .foregroundColor(.white)
                    }
                    Spacer()
                    Button {
                        vm.remove(image)
                    } label: {
                        Image(systemName: "trash.fill")
                            .foregroundColor(.red)
                    }
                }
                .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(navigations ? .visible : .hidden)
    }
}

struct ImageFullScreenView_Previews: PreviewProvider {
    static private let namespace = Namespace.ID.self
    static var previews: some View {
        ImageFullScreenView(image: UIImage(named: "plaseholderIMG")!)
    }
}
