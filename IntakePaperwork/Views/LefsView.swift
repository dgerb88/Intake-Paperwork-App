//
//  LefsView.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 10/25/21.
//

import SwiftUI

struct LefsView: View {
    
    @EnvironmentObject var model: SurveyModel
    var survey: Survey
    
    var body: some View {
        ForEach(0..<survey.questions.count) { index in
            VStack(alignment: .leading) {
                Text("\(survey.questions[index].title)")
                    .font(.headline)
                    .padding(.bottom, 5)
                Picker("", selection: $model.selectedValue[index]) {
                    ForEach(0..<survey.questions[index].rating.count) { ratingIndex in
                        Text(String(ratingIndex)).tag(ratingIndex)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                    .onChange(of: model.selectedValue) { newValue in
                        model.finishedSurvey = false
                        model.score = 0
                    }
                
            }.padding(.bottom, 40).padding(.top, 10)
        }
    }
}

