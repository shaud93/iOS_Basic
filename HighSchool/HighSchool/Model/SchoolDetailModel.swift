//
//  SchoolDetailModel.swift
//  HighSchool
//
//  Created by D'Ante Watson on 11/13/23.
//

import Foundation
struct SchoolDetailModel: Codable {
    var dbn:String
    var school_name:String
    var num_of_sat_test_takers:String
    var sat_critical_reading_avg_score:String
    var sat_math_avg_score:String
    var sat_writing_avg_score:String
}
