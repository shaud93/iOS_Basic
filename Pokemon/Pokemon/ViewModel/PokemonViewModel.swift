//
//  PokemonViewModel.swift
//  Pokemon
//
//  Created by D'Ante Watson on 11/8/23.
//

import Foundation
class PokemonViewModel:ObservableObject{
var network  = NetworkManager()
    @Published var pokemonListArray = [Pokemon]()


    func getDataFromviewModel() async{
        do{
            let result = try await network.getDataFromNetworkLayer(url: URL(string:APIendpoint.PokemonListEndpoint)!, modeltype: Response.self)
            DispatchQueue.main.async {
                self.pokemonListArray = result.data
            }
    }catch {
        print(error.localizedDescription)
    }
}
}
