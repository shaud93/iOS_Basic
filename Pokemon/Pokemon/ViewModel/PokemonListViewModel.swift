//
//  PokemonListViewManager.swift
//  Pokemon
//
//  Created by D'Ante Watson on 11/10/23.
//

import SwiftUI

struct PokemonListViewModel: View {
    @State var isErrorOccured:Bool = false
    @State var searchText:String = ""
    @StateObject var viewModel = PokemonViewModel()
    var body: some View {
        VStack {
            List(viewModel.pokemonListArray) { x in
                NavigationLink {
                    DetailSwiftUIView(name: x.name, img: x.images.small)
                } label: {
                    Text(x.name)
                }
                
            }
        }.task{
            await viewModel.getDataFromviewModel(urlString: APIendpoint.shared.PokemonListEndpoint)
            if (viewModel.customError != nil) {
                isErrorOccured = true
            }
        }
        .refreshable {
            await viewModel.getDataFromviewModel(urlString: APIendpoint.shared.PokemonListEndpoint)                    }
        .searchable(text: $searchText,placement: .automatic,prompt: "search Pokemon")
        .alert(isPresented: $isErrorOccured) {
            Alert(title: Text(viewModel.customError?.localizedDescription ?? ""), message: Text("Try Again"), dismissButton: .default(Text("Okay")))
        }
    }
}

#Preview {
    PokemonListViewModel()
}
