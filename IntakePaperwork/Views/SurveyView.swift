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
                    Text(survey.description[0])
                        .padding(.bottom, 5)
                    Text(survey.description[1])
                        .padding(.bottom, 10)
                    
                    ForEach(0..<survey.questions.count) { index in
                        VStack(alignment: .leading) {
                            Text("\(survey.questions[index]):")
                                .font(.headline)
                            Picker("", selection: $model.selectedValue[index]) {
                                ForEach(0..<survey.rating.count) { ratingIndex in
                                    Text(survey.rating[ratingIndex]).tag(ratingIndex)
                                }
                            }.pickerStyle(MenuPickerStyle())
                        }.padding(.bottom, 20)
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
                }.padding()
            }.navigationTitle(survey.name)
                .onDisappear {
                    model.selectedValue.removeAll()
                }
        }
    }
    }

