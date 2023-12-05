//
//  LocationNetworkManager.swift
//  MapKit_Practice
//
//  Created by D'Ante Watson on 12/3/23.
//

import Foundation
protocol NetworkableProtocal{
    func getApi<T:Decodable>(url: URL, modelType: T.Type, completionHandler: @escaping (Result<T, Error>) -> Void)
        
    }

class LocationNetworkManager:NetworkableProtocal{
    var networkresponseProtocol:NetworkResponseProtocal?
    
    func getApi<T>(url: URL, modelType: T.Type, completionHandler: @escaping(Result<T, Error>) -> Void) where T : Decodable {
        
        // Makes API call With Given URL ------ Will Return API Data , HTTP Response code and Error
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            //if error exist Throw an Error
            if let error = error{
                print(error.localizedDescription)
                completionHandler(.failure(error))
            }
            
            //Unwraps Response[checks is it nil] and check if the responsecode is 200 if not print invalid data
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("got invalid response code")
                return}
            
            //unwraps rawdata [checks is it nil] if it is nil print somthing
            guard let rawData = data else {
                print("couldnt get data")
                return
            }
            
            do {
                //turns raw data into readable data
                let result = try JSONDecoder().decode(modelType.self, from: rawData)
                completionHandler(.success(result))
            } catch {
                print("wrong data type")
                print(error.localizedDescription)
                completionHandler(.failure(error))
            }
            
        }
        task.resume()
        
    }
}

protocol NetworkResponseProtocal {
    func didFinishWithResponse(locationData:[LocationModel])
    func didFinishWithError(error:Error)
}

