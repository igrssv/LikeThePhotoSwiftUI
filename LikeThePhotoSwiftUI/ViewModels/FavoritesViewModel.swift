//
//  FavoritesViewModel.swift
//  LikeThePhotoSwiftUI
//
//  Created by Игорь Сысоев on 12.03.2023.
//

import Foundation
import UIKit

class FavoritesViewModel: ObservableObject {
    @Published var images: [UIImage] = []
    
    private let coreDataManager = CoreDataManager.shared
    
    init() {
        loadImage()
    }
    
    func loadImage() {
        images = coreDataManager.fetchData()
    }
}
