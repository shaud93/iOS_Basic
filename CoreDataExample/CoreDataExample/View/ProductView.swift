//
//  CoreDataView.swift
//  CoreDataExample
//
//  Created by D'Ante Watson on 11/23/23.
//

import SwiftUI
import CoreData

struct ProductView: View {
    @StateObject var productViewModel = ProductViewModel()
    var endpoint = ProductUrlEndpoint()
    
    @FetchRequest(entity: ProductEntity.entity(), sortDescriptors: [])
    
    var results:FetchedResults<ProductEntity>
    
    let request:NSFetchRequest<ProductEntity> = ProductEntity.fetchRequest()
    
//    @Environment(\.managedObjectContext) private var viewContext
//
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
//        animation: .default)
//    private var items: FetchedResults<Item>
    
    var body: some View {
        VStack{
            List(results) { product in
                VStack{
                    Text(product.title ?? "default value")
                }
            }
        }
        .onAppear(){
            do{
                try productViewModel.getProductData(urlString: endpoint.productEndpoint)
            }catch{print(error)}
        }
    }
}

#Preview {
    ProductView()
}
