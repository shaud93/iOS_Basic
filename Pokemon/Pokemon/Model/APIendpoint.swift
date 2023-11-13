//
//  APIendpoint.swift
//  Pokemon
//
//  Created by D'Ante Watson on 11/8/23.
//

import Foundation

final class APIendpoint {
    
    static var shared = APIendpoint()
    
var PokemonListEndpoint = "https://api.pokemontcg.io/v2/cards?page=1&pageSize=100"
    
    private init(PokemonListEndpoint: String = "https://api.pokemontcg.io/v2/cards?page=1&pageSize=100") {
        self.PokemonListEndpoint = PokemonListEndpoint
    }
}
