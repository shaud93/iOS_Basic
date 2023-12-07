//
//  LocationModel.swift
//  MapKit_Practice
//
//  Created by D'Ante Watson on 12/3/23.
//

import Foundation

struct LocationModel:Decodable, Identifiable {
    var id: Int
    var name: String
    var address:Address
}

struct Address:Decodable {
    var geo:Cord
}

struct Cord:Decodable {
    var lat:String
    var lng:String
}
