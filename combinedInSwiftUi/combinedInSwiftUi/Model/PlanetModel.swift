//
//  PlanetModel.swift
//  combinedInSwiftUi
//
//  Created by D'Ante Watson on 11/20/23.
//

import Foundation
struct PlanetModel {
    let count: Int
    let next: String
    let previous: NSNull
    let results: [PlanetData]
}

// MARK: - Result
struct PlanetData {
    let name, rotationPeriod, orbitalPeriod, diameter: String
    let climate, gravity, terrain, surfaceWater: String
    let population: String
    let residents, films: [String]
    let created, edited: String
    let url: String
}
