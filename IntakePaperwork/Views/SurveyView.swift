//
//  SurveyView.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 10/16/21.
//

import SwiftUI

struct SurveyView: View {
    
    @EnvironmentObject var model: SurveyModel
    var survey: Survey
    
    var body: some View {
        if model.selectedValue == [Int]() {
            ProgressView()
        }
        else {
            ScrollView {
                LazyVStack(alignment: .leading) {
                    Text(survey.description)
                        .padding(.bottom, 10)
                    
                    if survey.name == "LEFS" {
                        if survey.language == "English" {
                            Text("The following scale applies to every question:")
                                .padding(.bottom, 5)
                        }
                        else {
                            Text("El siguiente escala aplica a cada pregunta:")
                                .padding(.bottom, 5)
                        }
                        ForEach(0..<survey.questions[0].rating.count) { index in
                            Text(survey.questions[0].rating[index])
                                .padding(.bottom, 1)
                        }
                        Divider()
                            .padding(.bottom)
                        ForEach(0..<survey.questions.count) { index in
                            VStack(alignment: .leading) {
                                Text("\(survey.questions[index].title)")
                                    .font(.headline)
                                Picker("", selection: $model.selectedValue[index]) {
                                    ForEach(0..<survey.questions[index].rating.count) { ratingIndex in
                                        Text(String(ratingIndex)).tag(ratingIndex)
                                    }
                                }.pickerStyle(SegmentedPickerStyle())

                            }.padding(.bottom, 20)
                        }
                    }
                    else if survey.name == "Back Index" {
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
                                }

                            }.padding(.bottom, 20)
                        }
                    }
                   Button {
                       for index in 0..<model.selectedValue.count {
                           model.selectedValue[index] = 0
                       }
                       
                   } label: {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.green)
                                .frame(height: 48)
                                .cornerRadius(10)
                                .shadow(radius: 1)
                            Text("Finish")
                                .foregroundColor(.white)
                                .bold()
                        }
                            
                   }
                }.padding().padding(.horizontal, 40)
            }.navigationTitle(survey.name)
                .onDisappear {
                    model.selectedValue.removeAll()
                }
        }
    }
    }

