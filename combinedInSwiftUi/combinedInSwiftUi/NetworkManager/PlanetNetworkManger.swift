//
//  PlanetNetworkManger.swift
//  combinedInSwiftUi
//
//  Created by D'Ante Watson on 11/21/23.
//

import Foundation
import Combine

enum APIFailureCondition: Error {
    case invalidServerResponse
}

struct Response<T> {
    
    let value: T
    let response: URLResponse
}

class PlanetNetworkManger {
    static let shared = PlanetNetworkManger()
        
        func callAPI<T: Decodable>(_ url: URL) -> AnyPublisher<Response<T>, Error> {

            return URLSession.shared.dataTaskPublisher(for: url)
                .tryMap { result -> Response<T> in

                    guard let httpResponse = result.response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                        print("status code for api response : \((result.response as? HTTPURLResponse)?.statusCode ?? 200)")
                        throw APIFailureCondition.invalidServerResponse
                    }

                    let decoder = JSONDecoder()
                    let value = try decoder.decode(T.self, from: result.data)
                    return Response(value: value, response: result.response)
            }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
        }
}
