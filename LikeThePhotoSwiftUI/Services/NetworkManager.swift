//
//  NetworkManager.swift
//  LikeThePhotoSwiftUI
//
//  Created by Игорь Сысоев on 12.03.2023.
//

import Foundation
import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    private let url = "https://api.unsplash.com/photos/random?client_id="
    private let accessKey = ""
    
    init() {}
    
    func fetchImageModel(_ query: String, completion: @escaping([ImageModel]) -> Void) {
        print("im fetch sttart")
        var imageModels: [ImageModel] = []
        var urlString = url + accessKey
        if !query.isEmpty {
            urlString += "&query=" + query
        }
        
        guard let url = URL(string: urlString) else {
            return
        }
        for _ in 0...1 {
            URLSession.shared.dataTask(with: url) { data, _, error in
                guard let data = data, error == nil else {
                    print("Error fetchig image model: \(String(describing: error?.localizedDescription))")
                    return
                }
                
                if let decodeImage = try? JSONDecoder().decode(ImageModel.self, from: data) {
                    DispatchQueue.main.async {
                        print("add")
                        imageModels.append(decodeImage)
                    }
                }
                
            }.resume()
        }
        completion(imageModels)
        
    }
    
    func fetchImage(_ url: URL) -> UIImage? {
        var image: UIImage?
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                print("Error fetchig image: \(String(describing: error?.localizedDescription))")
                
                return
            }
            
            if let fetchImage = UIImage(data: data) {
                DispatchQueue.main.async {
                    image = fetchImage
                }
            }
        }.resume()
        
        return image
    }
}
