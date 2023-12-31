//
//  HighSchoolView.swift
//  HighSchool
//
//  Created by D'Ante Watson on 11/10/23.
//

import Foundation
class HighSchoolViewModel:ObservableObject{
    var network  = NetworkManager()
    
    @Published var highSchoolListArray = [School]()
    //Singleton
    let endpoint = APIEndpoint()
    
    func getDataFromviewModel() async{
        do{
            let result = try await network.getDataFromNetworkLayer(url: URL(string:endpoint.highschoolUrlString)!, modeltype: [School].self)
            DispatchQueue.main.async {
                self.highSchoolListArray = result
            }
    }catch {
        print(error.localizedDescription)
    }
}
}
