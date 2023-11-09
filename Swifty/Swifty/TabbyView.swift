//
//  TabView.swift
//  Swifty
//
//  Created by D'Ante Watson on 11/7/23.
//

import SwiftUI

struct Tabby: View {
    var body: some View {
        TabView{
            DIgiGrid()
                .tabItem {
                    Image(systemName: "trash.circle.fill")
                    Text("First Tab")
                }
            
            ContentView()
                .tabItem {
                    Image(systemName: "trash.circle.fill")
                    Text("Second Tab")
                }
            GeoUIView()
                .tabItem {
                    Image(systemName: "trash.circle.fill")
                    Text("Third Tab")
                }
        }
    }
}
#Preview {
    Tabby()
}
