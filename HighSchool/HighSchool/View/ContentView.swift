//
//  ContentView.swift
//  HighSchool
//
//  Created by D'Ante Watson on 11/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            VStack {
                HighschoolListViewModel()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
