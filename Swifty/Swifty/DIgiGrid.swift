//
//  DIgiGrid.swift
//  Swifty
//
//  Created by D'Ante Watson on 11/6/23.
//

import SwiftUI

struct DIgiGrid: View {
    @EnvironmentObject var network:Network
    
    let colums = [GridItem(.adaptive(minimum: 170))]
    var body: some View {
        Text("DIGIMON")
            .onAppear{
                network.getDigimon()
            }
        VStack{
            ScrollView{
                    VStack {
                        LazyVGrid(columns: colums,spacing: 10) {
                            ForEach(network.digimonList, id: \.name) { digimon in
                                let url = URL(string: digimon.img)
                                NavigationLink {
                                    DigimonDetails(name: digimon.name, level: digimon.level, img: digimon.img)
                                } label: {
                                    AsyncImage(url: url) { Image in
                                        Image.resizable()
                                            .frame(width: 170, height: 170)
                                            .aspectRatio(contentMode: .fit)
                                    } placeholder: {
                                        ProgressView()
                                    }
                                }
                        }
                    }
                    
                }
            }
        }
    }
}
//#Preview {
//    DIgiGrid()
//}
