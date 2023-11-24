//
//  NetworkManager.swift
//  CoreDataExample
//
//  Created by D'Ante Watson on 11/23/23.
//

import Foundation
import Combine

protocol Networking{
    func getDataFromNetworkLayer<T:Decodable>(url:URL, modeltype:T.Type) -> AnyPublisher<T,Error>
}

class NetworkManger:Networking {
    func getDataFromNetworkLayer<T>(url: URL, modeltype: T.Type) -> AnyPublisher<T, Error> where T : Decodable {
        return URLSession.shared.dataTaskPublisher(for: url)
            .map{$0.data}
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    
}
