//
//  NetworkManager.swift
//  Digimon
//
//  Created by D'Ante Watson on 11/2/23.
//

import Foundation
protocol NetworkableProtocal{
    func getApi<T:Decodable>(url: URL, modelType: T.Type, completionHandler: @escaping (Result<T, Error>) -> Void)
        
    }
class NetworkManager:NetworkableProtocal{
    func getApi<T>(url: URL, modelType: T.Type, completionHandler: @escaping(Result<T, Error>) -> Void) where T : Decodable {
        
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        
            if let error = error{
                print(error.localizedDescription)
                completionHandler(.failure(error))
            }
            
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    print("got invalid response code")
                    return}
                
                guard let rawData = data else {
                    print("couldnt get data")
                    return
                }
                do {
                     
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
