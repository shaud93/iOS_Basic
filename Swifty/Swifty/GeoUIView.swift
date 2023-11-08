//
//  GeoUIView.swift
//  Swifty
//
//  Created by D'Ante Watson on 11/8/23.
//

import SwiftUI

struct GeoUIView: View {
    var body: some View {
        VStack{
            GeometryReader(content: { geometry in
                HStack {
                    Text("box 1")
                        .frame(width: geometry.size.width/2, height: geometry.size.width/2)
                        .background(Color.blue)
                    Text("box 2")
                        .frame(width: geometry.size.width/2, height: geometry.size.width/2)
                        .background(Color.red)
                }
                })
        }.background(Color.black)
    }
}

#Preview {
    GeoUIView()
}
