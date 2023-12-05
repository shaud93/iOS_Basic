//
//  MapViewModel.swift
//  MapKit_Practice
//
//  Created by D'Ante Watson on 12/3/23.
//

import Foundation
import SwiftUI

class MapViewModel:ObservableObject{
    @Published var network = LocationNetworkManager()
    
     @Published var locationList = [LocationModel]()
    
    func getDataFromApi(){
        
        //converts the string url to a URL data typ
        guard let url = URL(string: ApiEndpoints().MapLocationURL)else {return}
        
        network.getApi(url: url, modelType: [LocationModel].self) { result in
            switch result {
                
            case .success(let location):
                DispatchQueue.main.async {
                    self.locationList = location
                    print(self.locationList[0].address.geo.lat)
                }
            case .failure(let error):
                print(error.localizedDescription)
                print(String(describing: error))
            }
        }
    }
}
