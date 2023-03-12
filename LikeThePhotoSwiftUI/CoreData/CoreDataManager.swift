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
            if error != nil {
                print("Unresolved error \(String(describing: error?.localizedDescription))")
            }
        }
    }
    
    func fetchData() -> [UIImage] {
        let request: NSFetchRequest<ImageEntity> = ImageEntity.fetchRequest()
        do {
            let result = try container.viewContext.fetch(request)
            let images = result.compactMap{ UIImage(data: $0.image ?? Data())}
            return images
        } catch {
            print("Error loading images: \(error.localizedDescription)")
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
    
    func remove(_ image: UIImage) {
        let request: NSFetchRequest<ImageEntity> = ImageEntity.fetchRequest()
        guard let dataImage = image.pngData() else { return }
        request.predicate = NSPredicate(format: "image = %@", dataImage as NSData )
        do {
            let imageEntities = try container.viewContext.fetch(request)
            for imageEntity in imageEntities {
                container.viewContext.delete(imageEntity)
            }
            try container.viewContext.save()
        } catch {
            print("Error remove image: \(error.localizedDescription)")
        }
    }
}
