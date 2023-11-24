//
//  SchoolDetailView.swift
//  HighSchool
//
//  Created by D'Ante Watson on 11/13/23.
//

import SwiftUI

struct SchoolDetailView: View {
    var id:String
    
    @StateObject var viewModel = HighSchoolDetailViewModel()
    
    
    var body: some View {

        VStack(alignment: .center, spacing: 40.0){
            /*
              0 ->school name
              1 ->num Of Test Takers
              2 ->criticalReadingAvgScore
              3 ->mathAvgScore
              4 ->writingAvgScore
             */
            
            if (viewModel.highSchoolDetail.isEmpty){
                Text("NO S.A.T Scores For This School")
                    .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.red, lineWidth: 4))
                        
                
                    
                    
            }
            else {
                let satData = getSATFromSchoolArray(_array: viewModel.highSchoolDetail)
                
                //TODO: change text size of school name
                Text(satData.0)
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .padding(.top, 40.0)
                Spacer()
                Text("Number Of Test Taker: \(satData.1)")
                    .font(.custom("Impact", size: 20))
                    .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.red, lineWidth: 4))
                    
                Text("Average Score Of Critical Reading Test: \(satData.2)")
                    .font(.custom("Impact", size: 20))
                    .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.red, lineWidth: 4))
                    
                Text("Average Score Of Math Test: \(satData.3)")
                    .font(.custom("Impact", size: 20))
                    .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.red, lineWidth: 4))
                    
                Text("Average Score Of Writing Test: \(satData.4)")
                    .font(.custom("Impact", size: 20))
                    .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.red, lineWidth: 4))
                    
                Spacer()
            }
           
            
            
            
            
        }.task{
            await viewModel.getDataFromviewModel(id: id)
        }
        .refreshable {
            await viewModel.getDataFromviewModel(id: id)
        }
    }
    
//    func isArrayEmpty(_array: [SchoolDetailModel] -> bool) {
//        if (array.isEmpty
//    }
    
    
    func getSATFromSchoolArray(_array:[SchoolDetailModel]) -> (String, String, String, String, String) {
        var schoolName:String = ""
        var numOfTestTakers:String = ""
        var criticalReadingAvgScore:String = ""
        var mathAvgScore:String = ""
        var writingAvgScore:String = ""
        _array.forEach { x in
            schoolName = x.school_name
            numOfTestTakers = x.num_of_sat_test_takers
            criticalReadingAvgScore = x.sat_critical_reading_avg_score
            mathAvgScore = x.sat_math_avg_score
            writingAvgScore = x.sat_writing_avg_score
        }
        return (schoolName, numOfTestTakers, criticalReadingAvgScore, mathAvgScore, writingAvgScore)
    }
}

#Preview {
    
    SchoolDetailView(id: " ")
}
