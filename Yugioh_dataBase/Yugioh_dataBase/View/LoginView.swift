//
//  ContentView.swift
//  Yugioh_dataBase
//
//  Created by D'Ante Watson on 11/15/23.
//

import SwiftUI

struct LoginView: View {
    @State var yugioh = [YugiohData]()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            if !yugioh.isEmpty {
                Text(yugioh[0].name)
            }else {
                ProgressView()
            }
            
            
        }
        .padding()
        .onAppear(){
            //TODO: send api data to a singleton array
            //TODO: add a bool singleton
            //TODO: add a ternary exp if bool is true run api
            ApiFetchHandler.sharedInstance.fetchAPIData { data in
                yugioh = data
                print(yugioh.count)
            }
        }
    }
}

#Preview {
    LoginView()
}
