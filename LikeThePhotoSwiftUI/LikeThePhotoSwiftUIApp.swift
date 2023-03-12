//
//  LikeThePhotoSwiftUIApp.swift
//  LikeThePhotoSwiftUI
//
//  Created by Игорь Сысоев on 12.03.2023.
//

import SwiftUI

@main
struct LikeThePhotoSwiftUIApp: App {
    private let context = CoreDataManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, context.container.viewContext)
        }
    }
}
