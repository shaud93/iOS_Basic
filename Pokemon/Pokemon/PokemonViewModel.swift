//
//  PokemonViewModel.swift
//  Pokemon
//
//  Created by D'Ante Watson on 11/8/23.
//

import Foundation
class PokemonViewModel:ObservableObject{
var network  = NetworkManager()
@Published var pokemonListArray = [Response]()


    func getDataFromviewModel() async{
        do{
            pokemonListArray = try await network.getDataFromNetworkLayer(url: URL(string:APIendpoint.PokemonListEndpoint)!, modeltype: [Response].self)
    }catch {
        print(error.localizedDescription)
    }
}
}
