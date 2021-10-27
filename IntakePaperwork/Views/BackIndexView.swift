//
//  BackIndexView.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 10/25/21.
//

import SwiftUI

struct BackIndexView: View {
    
    @EnvironmentObject var model: SurveyModel
    var survey: Survey
    
    var body: some View {
        ForEach(0..<survey.questions.count) { index in
            VStack(alignment: .leading) {
                Text("\(survey.questions[index].title)")
                    .font(.title)
                Picker("", selection: $model.selectedValue[index]) {
                    ForEach(0..<survey.questions[index].rating.count) { ratingIndex in
                        Text(String(ratingIndex)).tag(ratingIndex)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                ForEach(0..<survey.questions[index].rating.count) { ratingIndex in
                    Text(survey.questions[index].rating[ratingIndex]).tag(ratingIndex)
                }.padding(.leading, 10)
                
                
            }.padding(.vertical, 20)
        }
    }
}

