//
//  NetworkManager.swift
//  Pokemon
//
//  Created by D'Ante Watson on 11/8/23.
//

import Foundation

protocol networking {
    func getDataFromNetworkLayer<T:Decodable>(url:URL, modeltype:T.Type) async throws -> T
}

class NetworkManager:networking{
    func getDataFromNetworkLayer<T>(url: URL, modeltype: T.Type) async throws -> T where T : Decodable {
        do{
            let (data,_) = try await URLSession.shared.data(for: data)
            let parseData = try JSONDecoder().decode(modeltype.self, from: data)
            return parseData
        }catch{
            throw error
        }
    }
    
}
