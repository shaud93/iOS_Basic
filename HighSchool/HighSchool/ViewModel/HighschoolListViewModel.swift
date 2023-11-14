//
//  HighschoolListViewModel.swift
//  HighSchool
//
//  Created by D'Ante Watson on 11/10/23.
//

import SwiftUI
struct HighschoolListViewModel: View {
    @StateObject var viewModel = HighSchoolViewModel()
    var body: some View {
        VStack {
            List(viewModel.highSchoolListArray) { x in
                HStack{
                    NavigationLink {
                        SchoolDetailView(id:x.id)
                    } label: {
                        Text(x.school_name)
                    }

                    
                }
            }
        }.task{
            await viewModel.getDataFromviewModel()
        }
        .refreshable {
            await viewModel.getDataFromviewModel()                    }
    }
}

#Preview {
    HighschoolListViewModel()
}
