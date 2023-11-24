//
//  ProductViewModel.swift
//  CoreDataExample
//
//  Created by D'Ante Watson on 11/23/23.
//

import Foundation
import Combine

let manager = NetworkManger()

class ProductViewModel:ObservableObject {
    @Published var productList = [ProductData]()
    
    @Published var customError:NetworkError?
    
    let coreDataManager = CoreDataManager(context: PersistenceController.shared.container.viewContext)
    
    var cancelabel = Set<AnyCancellable>()
    
    func getProductData(urlString:String) throws{
            guard let url = URL(string: urlString) else { throw NetworkError.urlError}
            
            manager.getDataFromNetworkLayer(url: url, modeltype: Product.self)
            .receive(on: RunLoop.main)
                .sink { [self] completion in
                    switch completion {
                        
                    case .finished:
                        print("in Finished case")
                    case .failure(let error):
                        switch error {
                        case NetworkError.parsingError:
                            customError = NetworkError.parsingError
                        case NetworkError.serverNotFound:
                            customError = NetworkError.serverNotFound
                        case NetworkError.urlError:
                            customError = NetworkError.urlError
                        default:
                            customError = NetworkError.dataNotFound
                        }
                        print(error.localizedDescription)
                        print(String(describing: error))
                    }
                } receiveValue: { Product in
                    self.productList = Product.products
                    self.getSQLitePath()
                    Task{
                        try await self.coreDataManager.deleteAllRecords()
                        try await self.coreDataManager.saveDataFromDataBase(list: Product.products)
                    }
                    //print(self.productList)
                }.store(in: &cancelabel)
    }
    
    func getSQLitePath(){
        guard let url = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first else { return }
        
        let sqlite = url.appendingPathComponent("CoreDataExample")
        print(sqlite)
    }
}
