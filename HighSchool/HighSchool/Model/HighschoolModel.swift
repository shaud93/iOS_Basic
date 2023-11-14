//
//  HighschoolModel.swift
//  HighSchool
//
//  Created by D'Ante Watson on 11/10/23.
//

import Foundation

struct School:Codable, Identifiable {
    let id: String
    let school_name:String
    
    enum CodingKeys: String, CodingKey {
        case id = "dbn"
        case school_name
    }
}
