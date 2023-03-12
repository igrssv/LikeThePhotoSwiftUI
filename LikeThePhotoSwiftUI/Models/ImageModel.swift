//
//  ImageModel.swift
//  LikeThePhotoSwiftUI
//
//  Created by Игорь Сысоев on 12.03.2023.
//

import Foundation

struct ImageModel: Codable {
    let id: String
    let urls: URLs
    
    struct URLs: Codable {
        let regular: URL
    }
}
