//
//  FindView.swift
//  LikeThePhotoSwiftUI
//
//  Created by Игорь Сысоев on 12.03.2023.
//

import SwiftUI

struct FindView: View {
    @StateObject private var vm = FindViewModel()
    var body: some View {
        VStack {
            Text("LikeThePhoto")
                .font(.largeTitle)
                .bold()
            Text("\(vm.imageModels.count)")
            if let index = vm.index {
                ImageCardView(image: vm.images[index])
            } else {
                ImageCardView(image: nil)
            }
            
            HStack() {
                ButtonView(titel: "star", color: .green, action: {})
                Spacer()
                ButtonView(titel: "square.and.arrow.up", color: .blue, action: {})
                Spacer()
                ButtonView(titel: "arrowshape.right", color: .orange, action: vm.nextImage)
            }
            .disabled(vm.images.isEmpty)
        }
        .padding()
    }
    
    @ViewBuilder
    func showImageCard(_ image: String? = nil) -> some View {
        ImageCardView(image: image)
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
