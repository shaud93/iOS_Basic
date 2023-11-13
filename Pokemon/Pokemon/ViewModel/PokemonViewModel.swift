//
//  PokemonViewModel.swift
//  Pokemon
//
//  Created by D'Ante Watson on 11/8/23.
//

import Foundation
class PokemonViewModel:ObservableObject{
    
    var network:networking
    init(network: networking = NetworkManager()){
        self.network = network
    }
    
    @Published var pokemonListArray = [Pokemon]()
    //Singleton
    let endpoint = APIendpoint.shared
    
    var customError:NetworkError?
    
    func getDataFromviewModel(urlString:String) async{
        do{
            guard let url = URL(string: urlString) else{throw NetworkError.urlError}
            let result = try await network.getDataFromNetworkLayer(url: url, modeltype: Response.self)
            DispatchQueue.main.async {
                self.pokemonListArray = result.data
            }
    }catch {
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
    }
}
}
