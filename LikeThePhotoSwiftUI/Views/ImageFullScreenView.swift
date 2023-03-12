//
//  ImageFullScreenView.swift
//  LikeThePhotoSwiftUI
//
//  Created by Игорь Сысоев on 12.03.2023.
//

import SwiftUI

struct ImageFullScreenView: View {
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
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(scale)
                    .gesture(magnificator)
                    .onTapGesture {
                        showNavigation()
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
                            
                        } label: {
                            Image(systemName: "trash.fill")
                                .foregroundColor(.red)
                        }

                    }
                    .padding()
                }
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
