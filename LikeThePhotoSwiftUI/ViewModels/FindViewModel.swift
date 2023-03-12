//
//  FindViewModel.swift
//  LikeThePhotoSwiftUI
//
//  Created by Игорь Сысоев on 12.03.2023.
//

import Foundation
import UIKit


class FindViewModel: ObservableObject {
    @Published var images: [String] = []
    @Published var query = ""
    @Published var index: Int?
    
    @Published var imageModels: [ImageModel] = []
    
    private var networkManager = NetworkManager.shared
    
    init() {
        fetchDemoImage()
    }
    
    private func fetchDemoImage() {
        let images = ["demo1", "demo2", "demo3", "demo4"]
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
            images.forEach { name in
                self.images.append(name)
            }
            self.index = 0
        }
    }
    
    func nextImage() {
        if  let currentIndex = index, currentIndex < images.count - 1 {
            index! = currentIndex + 1
        } else {
            index = nil
        }
    }
}
