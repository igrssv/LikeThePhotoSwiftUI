//
//  ContentView.swift
//  LikeThePhotoSwiftUI
//
//  Created by Игорь Сысоев on 12.03.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            FindView()
                .tabItem {
                    Image(systemName: "photo.circle")
                    Text("Find Image")
                }
            
            FindView()
                .tabItem {
                    Image(systemName: "star")
                    Text("Favorites")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
