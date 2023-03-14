//
//  FindView.swift
//  LikeThePhotoSwiftUI
//
//  Created by Игорь Сысоев on 12.03.2023.
//

import SwiftUI

struct FindView: View {
    @StateObject private var vm = FindViewModel()
    
    private func shareImage() -> Image {
        if vm.images.isEmpty {
            return Image("plaseholderIMG")
        } else {
            return Image(uiImage: vm.images[vm.index])
        }
    }
    
    var body: some View {
        VStack {
            Text("LikeThePhoto")
                .font(.largeTitle)
                .bold()
            if vm.images.isEmpty {
                ImageCardView(image: nil)
            } else {
                ImageCardView(image: vm.images[vm.index])
            }
            
            HStack() {
                ButtonView(titel: "star", color: .green, action: vm.saveImage)
                Spacer()
                
                ShareLink(
                    item: shareImage(),
                    preview: SharePreview(
                        "LikeThePhoto",
                        image: shareImage()
                    )
                ) {
                    Image(systemName: "square.and.arrow.up")
                        .foregroundColor(.black)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .cornerRadius(20)
                }
                
                Spacer()
                ButtonView(titel: "arrowshape.right", color: .orange, action: vm.nextImage)
            }
            .disabled(vm.images.isEmpty)
        }
        .padding()
    }
}

struct FindView_Previews: PreviewProvider {
    static var previews: some View {
        FindView()
    }
}

struct ButtonView: View {
    let titel: String
    let color: Color
    let action: () -> ()
    var body: some View {
        Button {
            withAnimation {
                action()
            }
        } label: {
            Image(systemName: titel)
                .foregroundColor(.black)
                .padding()
        }
        .frame(maxWidth: .infinity)
        .background(color)
        .cornerRadius(20)
    }
}
