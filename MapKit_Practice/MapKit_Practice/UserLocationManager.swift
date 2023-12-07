//
//  UserLocationManager.swift
//  MapKit_Practice
//
//  Created by D'Ante Watson on 12/4/23.
//

import Foundation
import CoreLocation
import MapKit
import SwiftUI

//This class will get USER current Location
@MainActor
class UserLocationManager:NSObject, ObservableObject{
    @Published var curretLocation:CLLocation?
    
    let locationManager = CLLocationManager()
    
    //when an instance of this class is made it will ask user for location permission
    override init() {
        super.init()
        
        //accuracy is set as BEST
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager.distanceFilter = kCLDistanceFilterNone
        
        //Will request User Permission
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.delegate = self
        
        //will keep track and report user current location
        locationManager.startUpdatingLocation()
    }
}
extension UserLocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //gets the user last location in the array of location recoreded
        guard let location = locations.last else{return}
        
        self.curretLocation = location
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
//    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
//        switch manager.authorizationStatus{
//            
//        case .notDetermined:
//            
//        case .restricted:
//            <#code#>
//        case .denied:
//            <#code#>
//        case .authorizedAlways:
//            <#code#>
//        case .authorizedWhenInUse:
//            <#code#>
//        @unknown default:
//            <#code#>
//        }
//    }

}

//A rectangular geographic region that centers around a specific latitude and longitude.
//will return a binding 
extension MKCoordinateRegion{
    func getBinding()-> Binding<MKCoordinateRegion>?{
        return Binding<MKCoordinateRegion>(.constant(self))
    }
}
