//
//  DetailSwiftUIView.swift
//  Pokemon
//
//  Created by D'Ante Watson on 11/9/23.
//

import SwiftUI

struct DetailSwiftUIView: View {
    var name:String = ""
    var body: some View {
        VStack{
            Text(name)
        }
        
    }
}

#Preview {
    DetailSwiftUIView()
}
