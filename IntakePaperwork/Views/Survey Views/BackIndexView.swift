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
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(5)
                .shadow(radius: 5)
            VStack(alignment: .leading) {
                Text(survey.description)
                    .font(.headline)
                    .padding(.bottom, 10)
                Divider()
                ForEach(0..<survey.questions.count) { index in
                    Text("\(survey.questions[index].title)")
                        .font(.title)
                    Picker("", selection: $model.selectedValue[index]) {
                        ForEach(0..<survey.questions[index].rating.count) { ratingIndex in
                            Text(String(ratingIndex)).tag(ratingIndex)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                        .onChange(of: model.selectedValue) { newValue in
                            model.finishedSurvey = false
                            model.score = 0
                        }
                    ForEach(0..<survey.questions[index].rating.count) { ratingIndex in
                        Text(survey.questions[index].rating[ratingIndex]).tag(ratingIndex)
                    }.padding(.leading, 10)
                    Divider().padding(.bottom)
                }
                Button {
                    if model.finishedSurvey != true {
                        for index in 0..<model.selectedValue.count {
                            model.score += model.selectedValue[index]
                        }
                    }
                    model.finishedSurvey = true
                    
                } label: {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.green)
                            .frame(height: 48)
                            .cornerRadius(10)
                            .shadow(radius: 1)
                        if model.finishedSurvey {
                            Text("Score: \(Int(Double(model.score*100/50)))%")
                                .foregroundColor(.white)
                                .bold()
                        }
                        
                        else {
                            Text("Finish")
                                .foregroundColor(.white)
                                .font(.title)
                                .bold()
                        }
                    }
                    
                }.padding(.vertical, 5)
            }.onAppear {
                model.score = 0
            }.padding()
        }
    }
}

