//
//  HighschoolDetailViewModel.swift
//  HighSchool
//
//  Created by D'Ante Watson on 11/13/23.
//

import Foundation
class HighSchoolDetailViewModel:ObservableObject{
    var network  = NetworkManager()
    
    @Published var highSchoolDetail = [SchoolDetailModel]()
    //Singleton
    
    func getDataFromviewModel(id:String) async{
        do{
            let result = try await network.getDataFromNetworkLayer(url: URL(string:"https://data.cityofnewyork.us/resource/f9bf-2cp4.json?dbn=\(id)")!, modeltype: [SchoolDetailModel].self)
            DispatchQueue.main.async {
                self.highSchoolDetail = result
                print(result)
                //print(self.highSchoolDetail)
            }
    }catch {
        print(error.localizedDescription)
    }
}
}
