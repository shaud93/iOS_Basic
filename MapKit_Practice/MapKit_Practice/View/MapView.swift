//
//  MapView.swift
//  MapKit_Practice
//
//  Created by D'Ante Watson on 12/3/23.
//

import SwiftUI

struct MapView: View {
    @StateObject var mapViewModel = MapViewModel()
    @State var locationList = [LocationModel]()
    var body: some View {
        //TODO: map video at 38:00
        VStack{
            if(!mapViewModel.locationList.isEmpty){
                Text(mapViewModel.locationList[0].address.geo.lng)
            } else {
                ProgressView()
            }
           
        }.onAppear() {
            DispatchQueue.main.async {
                mapViewModel.getDataFromApi()
            }
        }
    }
}

#Preview {
    MapView()
}
