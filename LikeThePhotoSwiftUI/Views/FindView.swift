//
//  FindView.swift
//  LikeThePhotoSwiftUI
//
//  Created by Игорь Сысоев on 12.03.2023.
//

import SwiftUI

struct FindView: View {
    var body: some View {
        VStack {
            Text("LikeThePhoto")
                .font(.largeTitle)
                .bold()
            ImageCardView(image: "demoIMG")
            HStack() {
                ButtonView(titel: "star", color: .green)
                Spacer()
                ButtonView(titel: "square.and.arrow.up", color: .blue)
                Spacer()
                ButtonView(titel: "arrowshape.right", color: .orange)
            }
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
    var body: some View {
        Button {
            
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
