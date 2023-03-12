//
//  CoreDataManager.swift
//  LikeThePhotoSwiftUI
//
//  Created by Игорь Сысоев on 12.03.2023.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager {
    static let shared = CoreDataManager()
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "LikeThePhoto")
        container.loadPersistentStores { (storeDescription, error) in
            if let erorr = error {
                fatalError("Unresolved error \(error?.localizedDescription)")
            }
        }
    }
    
    func fetchData() -> [UIImage] {
        let request: NSFetchRequest<ImageEntity> = ImageEntity.fetchRequest()
        do {
            let result = try container.viewContext.fetch(request)
            let images = result.compactMap{ UIImage(data: $0.image ?? Data())} // corrected
            return images
        } catch {
            print("Error loading images: \(error)")
        }
        return []
    }
    
    func saveImage(_ image: UIImage) {
        let imageData = image.pngData()
        let imageEntity = ImageEntity(context: container.viewContext)
        imageEntity.image = imageData
        do {
            try container.viewContext.save()
        } catch {
            print("Error save image: \(error)")
        }
    }
    
    func remove() {
        
    }
}
