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
    private let accessKey = ""

    init() {}
    
    func fetchImages(_ category: String?, completion: @escaping([UIImage]?) -> Void) {
        var url = "https://api.unsplash.com"
        
        if let category = category {
            url = url + "/search/photos?query=" + category + "&per_page=10&client_id="
        } else {
            url += "/photos/random/?count=10&client_id="
        }
        
        guard let apiUrl = URL(string: url + accessKey) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: apiUrl) { data, _, error in
            
            guard error == nil else {
                print("error : \(String(describing: error?.localizedDescription))")
                completion(nil)
                return
            }
            
            guard let data = data else {
                print("no data")
                completion(nil)
                return
            }
            
            do {
                let results = try JSONDecoder().decode([ImageModel].self, from: data)
                var images: [UIImage] = []
                
                for result in results {
                    if let imageUrl = URL(string: result.urls.regular),
                       let imageData = try? Data(contentsOf: imageUrl),
                       let image = UIImage(data: imageData) {
                        images.append(image)
                    }
                }
                
                completion(images)
                
            } catch {
                print("error decode: \(error.localizedDescription)")
            }
        }.resume()
    }
}
