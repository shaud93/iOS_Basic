//
//  DigimonDetails.swift
//  Swifty
//
//  Created by D'Ante Watson on 11/6/23.
//

import SwiftUI

struct DigimonDetails: View {
    var name:String = " "
    var level:String = " "
    var img:String = " "
    
    var body: some View {
        VStack{
            Text(name)
            let url = URL(string: img)
            AsyncImage(url: url) { Image in
                Image.resizable()
                    .frame(width: 400, height: 400)
            } placeholder: {
                ProgressView()
            }

            Text(level)
        }
        
    }
}

#Preview {
    DigimonDetails()
}
