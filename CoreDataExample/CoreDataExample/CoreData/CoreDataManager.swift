//
//  CoreDataManager.swift
//  CoreDataExample
//
//  Created by D'Ante Watson on 11/23/23.
//

import Foundation
import CoreData

class CoreDataManager:CoreDataActions {
    
//    let context:NSManagedObjectContext
//    
//    init(context: NSManagedObjectContext) {
//        self.context = context
//    }
    
    func saveDataFromDataBase(list: [ProductData]) async throws {
        
        // makes the save save data function run on back ground
        try await PersistenceController.shared.container.performBackgroundTask { ObjectContext in
            
            list.forEach { product in
                
                //get the product table
                let productEntity = ProductEntity(context: ObjectContext)
                
                let productImageEntity = ProductImagesEntity(context: ObjectContext)
                
                //populates the productEntity table from api list
                productEntity.brand = product.brand
                productEntity.category = product.category
                productEntity.desc = product.description
                productEntity.discountPercentage = product.discountPercentage
                productEntity.price = Int32(product.price)
                productEntity.rating = product.rating
                productEntity.stock = Int32(product.stock)
                productEntity.thumbnail = product.thumbnail
                productEntity.title = product.title
                
                //populates the productImageEntity table from api list
                productImageEntity.productID = product.title + product.thumbnail
                productImageEntity.productImage = product.images[0]
                
             
                
                productEntity.imageRelationship = productImageEntity
            }
                
                do{
                    //save all data to table
                    try ObjectContext.save()
                }catch{
                    print(error.localizedDescription)
                    print(String(describing: error))
                    throw error
                }
        }
        
            
    }
    
    func deleteDataFromDataBase(entry: ProductEntity) async throws {
        // makes the deleteDataFromDataBase function run on back ground
      await PersistenceController.shared.container.performBackgroundTask { ObjectContext in
            
            ObjectContext.delete(entry)
        }
    }
    
    func getdatafromDataBase() async throws -> [ProductEntity] {
        // makes the getdatafromDataBase function run on back ground
        try await PersistenceController.shared.container.performBackgroundTask { ObjectContext in
            
            //gets the table [productentity] in stores into request
            let request:NSFetchRequest<ProductEntity> = ProductEntity.fetchRequest()
            
            //gets all the rows of data from the table and stores into an ARRAY named allRecords
            let allRecords = try ObjectContext.fetch(request)
            
            //return an array ProductEntity
            return allRecords
        }
    }
    
    func deleteAllRecords()async throws{
        // makes the getdatafromDataBase function run on back ground
        try await PersistenceController.shared.container.performBackgroundTask { ObjectContext in
            
            //gets the table [productentity] in stores into request
            let request:NSFetchRequest<ProductEntity> = ProductEntity.fetchRequest()
            
            let request2:NSFetchRequest<ProductImagesEntity> = ProductImagesEntity.fetchRequest()
            
            //gets all the rows of data from the table and stores into an ARRAY named allRecords
            let allRecords = try ObjectContext.fetch(request)
            
            let allRecords2 = try ObjectContext.fetch(request2)
            
            //loops through the array and delete each row of data
            allRecords.forEach { ProductEntity in
                ObjectContext.delete(ProductEntity)
            }
            
            allRecords2.forEach { ProductImagesEntity in
                ObjectContext.delete(ProductImagesEntity)
            }
            
        }
    }
}
protocol CoreDataActions {
    func saveDataFromDataBase(list:[ProductData]) async throws
    func deleteDataFromDataBase(entry:ProductEntity) async throws
    func getdatafromDataBase() async throws -> [ProductEntity]
}
