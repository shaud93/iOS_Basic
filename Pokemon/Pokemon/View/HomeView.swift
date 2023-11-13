//
//  HomeView.swift
//  Pokemon
//
//  Created by D'Ante Watson on 11/9/23.
//

import SwiftUI

struct HomeView: View {
var body: some View {
NavigationStack{
ZStack{
GeometryReader(content: { geometry in
Image("pica_Home")
.resizable()
.frame(width: geometry.size.width, height: geometry.size.height)

VStack{

NavigationLink {
ContentView()
} label: {


//TODO: replace buttpn with text 
Button("START") {

}
.padding(.vertical, geometry.size.height/2)
.padding(.leading, geometry.size.width/2)
.padding(.leading, -50.0)
.padding(.top, 200.0)
.font(.custom("Impact", size: 40))

}




}
})


}.background(Color(red: 0.986, green: 0.805, blue: 0.236))
}
}
}

#Preview {
    HomeView()
}
