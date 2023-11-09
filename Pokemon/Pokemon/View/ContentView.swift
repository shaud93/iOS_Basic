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
                ScrollView{
                    List(viewModel.pokemonListArray) { x in
                        NavigationLink {
                            DetailSwiftUIView(name: x.name)
                        } label: {
                            Text(x.name)
                        }
                        
                    }
                }
                .onAppear{
                    Task{await viewModel.getDataFromviewModel()
                    }
                    
                }
            }
        }
    }
    }

#Preview {
    ContentView()
}
