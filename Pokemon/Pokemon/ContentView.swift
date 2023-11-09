//
//  ContentView.swift
//  Pokemon
//
//  Created by D'Ante Watson on 11/8/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = PokemonViewModel()
    var body: some View {
        VStack {
            List(viewModel.pokemonListArray, id: \.count) { x in
                Text(x.data[0].name)
            }
        }
        .onAppear{
            Task{
                await viewModel.getDataFromviewModel()
            }
            }
    }
    }

#Preview {
    ContentView()
}
