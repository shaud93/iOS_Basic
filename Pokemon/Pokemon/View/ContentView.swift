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
        NavigationStack{
            VStack {
                    List(viewModel.pokemonListArray) { x in
                        NavigationLink {
                            DetailSwiftUIView(name: x.name, img: x.images.small)
                        } label: {
                            Text(x.name)
                        }
                        
                    }
                    .task{
                        await viewModel.getDataFromviewModel()
                    }
                    .refreshable {
                        await viewModel.getDataFromviewModel()                    }
                }
            }
        }
    }

#Preview {
    ContentView()
}
