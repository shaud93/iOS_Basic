//
//  CoreDataManager.swift
//  CoreDataExample
//
//  Created by D'Ante Watson on 11/23/23.
//

import Foundation
import CoreData

class CoreDataManager:CoreDataActions {
    
    let context:NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func saveDataFromDataBase(list: [ProductData]) async throws {
        list.forEach { product in
            
            let productEntity = ProductEntity(context: self.context)
            productEntity.brand = product.brand
            productEntity.category = product.category
            productEntity.desc = product.description
            productEntity.discountPercentage = product.discountPercentage
            productEntity.price = Int32(product.price)
            productEntity.rating = product.rating
            productEntity.stock = Int32(product.stock)
            productEntity.thumbnail = product.thumbnail
            productEntity.title = product.title
        }
            
            do{
                try self.context.save()
            }catch{
                print(error.localizedDescription)
                print(String(describing: error))
                throw error
            }
            
    }
    
    func deleteDataFromDataBase(entry: ProductData) async throws {
        
    }
    
    func getdatafromDataBase() async throws -> [ProductEntity] {
        //gets the table [productentity] in stores into request
        let request:NSFetchRequest<ProductEntity> = ProductEntity.fetchRequest()
        
        //gets all the rows of data from the table and stores into an ARRAY named allRecords
        let allRecords = try self.context.fetch(request)
        
        //return an array ProductEntity
        return allRecords
    }
    
    func deleteAllRecords()async throws{
        //gets the table [productentity] in stores into request
        let request:NSFetchRequest<ProductEntity> = ProductEntity.fetchRequest()
        
        //gets all the rows of data from the table and stores into an ARRAY named allRecords
        let allRecords = try self.context.fetch(request)
        
        //loops through the array and delete each row of data
        allRecords.forEach { ProductEntity in
            self.context.delete(ProductEntity)
        }
        
        
    }
   
}
protocol CoreDataActions {
    func saveDataFromDataBase(list:[ProductData]) async throws
    func deleteDataFromDataBase(entry:ProductData) async throws
    func getdatafromDataBase() async throws -> [ProductEntity]
}
