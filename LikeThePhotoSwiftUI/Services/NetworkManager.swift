//
//  NetworkManager.swift
//  LikeThePhotoSwiftUI
//
//  Created by Игорь Сысоев on 12.03.2023.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private let url = "https://api.unsplash.com/photos/random?client_id="
    private let accessKey = ""
    
    init() {}
    
    func fetchImage(_ query: String? = nil) -> ImageModel? {
        var image: ImageModel?
        var urlString = url + accessKey
        if let query = query {
            urlString += "&query=" + query
        }
        
        guard let url = URL(string: urlString) else { return nil }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                print("Error fetchig image: \(String(describing: error?.localizedDescription))")
                return
            }
            
            if let decodeImage = try? JSONDecoder().decode(ImageModel.self, from: data) {
                DispatchQueue.main.async {
                    image = decodeImage
                }
            }

        }.resume()
        
        return image
    }
}
