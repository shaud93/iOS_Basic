//
//  ContentView.swift
//  Swifty
//
//  Created by D'Ante Watson on 11/6/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            VStack {
                Image("Digimon_Blue")
                    .resizable()
                    .frame(width: 400, height: 880)
                    .overlay {
                        VStack {
                            Text("DIGIMON IDEX")
                                .font(.custom("Techno", size: 30))
                                .fontWeight(.bold)
                                .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.995, green: 1.0, blue: 0.209)/*@END_MENU_TOKEN@*/)
                                .padding(.trailing, 80.0)
                            
                            NavigationLink(destination: DIgiGrid()) {
                                Text("GO")
                                    .font(.custom("Techno", size: 50))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(red: 0.69, green: 0.262, blue: 0.318))
                                    
                            }
                            .padding(.trailing, 70.0)
                            
                        }
                    }
            }
            .padding()
        }
    }
}
#Preview {
    ContentView()
}
