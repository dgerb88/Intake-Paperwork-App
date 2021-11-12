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
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(5)
                .shadow(radius: 5)
            VStack(alignment: .leading) {
                Text(survey.description)
                    .font(.headline)
                    .padding(.bottom, 10)
                if survey.language == "English" {
                    Text("The following scale applies to every question:")
                        .font(.headline)
                        .bold()
                        .padding(.bottom, 5)
                        
                }
                else {
                    Text("El siguiente escala aplica a cada pregunta:")
                        .font(.headline)
                        .bold()
                        .padding(.bottom, 5)
                }
                ForEach(0..<survey.questions[0].rating.count) { index in
                    Text(survey.questions[0].rating[index])
                        .font(.subheadline)
                        .padding(.bottom, 1)
                        .padding(.leading, 20)
                }
                Divider()
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
                            Text("Score: \(model.score)/80")
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
                    
                }.padding(.top, 5)
            }.padding()
        }
        .onAppear {
            model.score = 0
        }
    }
}

