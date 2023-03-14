//
//  FindViewModel.swift
//  LikeThePhotoSwiftUI
//
//  Created by Игорь Сысоев on 12.03.2023.
//

import Foundation
import UIKit


class FindViewModel: ObservableObject {
    @Published var images: [UIImage] = []
    @Published var query: String?
    @Published var index = 0
        
    private var networkManager = NetworkManager.shared
    private var coreDataManager = CoreDataManager.shared
    
    init() {
        fetchImage()
    }
    
    private func fetchImage() {
        networkManager.fetchImages(query) { images in
            DispatchQueue.main.async {
                if let fetchImages = images {
                    self.images = fetchImages
                } else {
                    self.images = []
                }
            }
        }
    }
    
    func nextImage() {
        if index < images.count - 1 {
            index += 1
        } else {
            index = 0
            images = []
            fetchImage()
        }
    }
    
    func saveImage() {
        coreDataManager.saveImage(images[index])
    }
}
