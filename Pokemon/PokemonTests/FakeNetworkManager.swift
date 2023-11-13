//
//  FakeNetworkManager.swift
//  PokemonTests
//
//  Created by D'Ante Watson on 11/12/23.
//

import Foundation
@testable import Pokemon

class FakeNetworkManager:networking {
    func getDataFromNetworkLayer<T>(url: URL, modeltype: T.Type) async throws -> T where T : Decodable {
           let bundle = Bundle(for: FakeNetworkManager.self)
        let url = bundle.url(forResource:url.absoluteString, withExtension:"json")
        guard let url = url else {throw NetworkError.urlError}
           do {
            let rawB = try Data(contentsOf: url)
            let res = try JSONDecoder().decode(modeltype.self, from: rawB)
            print(res)
            return res
           } catch {throw NetworkError.dataNotFound}

    }
    
    
}
