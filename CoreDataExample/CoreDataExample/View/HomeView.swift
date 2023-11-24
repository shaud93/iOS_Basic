//
//  Home.swift
//  CoreDataExample
//
//  Created by D'Ante Watson on 11/23/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack{
            VStack{
                NavigationLink {
                    ProductView()
                } label: {
                    Text("CORE DATA")
                }
                NavigationLink {
                    KeyChainView()
                } label: {
                    Text("KEYCHAIN")
                }

            }
        }
    }
}

#Preview {
    HomeView()
}
