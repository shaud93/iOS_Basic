//
//  MapView.swift
//  MapKit_Practice
//
//  Created by D'Ante Watson on 12/3/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    //will ask user for location permission
    @StateObject var userLocationManager = UserLocationManager()
    
    @StateObject var mapViewModel = MapViewModel()
    
    @State var locationList = [LocationModel]()
    
    @State var staticRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.50, longitude: -0.127), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    var region:Binding<MKCoordinateRegion>?{
        guard let location = userLocationManager.curretLocation else{
            return MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.50, longitude: -0.127), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)).getBinding()
        }
        let actualRegion = MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
        return actualRegion.getBinding()
    }
    
    var body: some View {
        //TODO: map video at 1:13.00
        VStack{
            if(!mapViewModel.locationList.isEmpty){
                //Map(coordinateRegion: $staticRegion)
                //Text(mapViewModel.locationList[0].address.geo.lng)
                if let region = region {
                    //Map(coordinateRegion: region).ignoresSafeArea()
                    Map(coordinateRegion: region, annotationItems: mapViewModel.locationList, annotationContent: { place in
                        MapMarker(coordinate: CLLocationCoordinate2D(latitude: Double(place.address.geo.lat) ?? 0.0, longitude: Double(place.address.geo.lng) ?? 0.0))
                    }).ignoresSafeArea()
                }
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
