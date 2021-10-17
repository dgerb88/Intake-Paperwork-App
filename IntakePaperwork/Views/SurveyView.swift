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
    
    @State var selectedValue = 0
    
    var body: some View {
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
                        Picker("", selection: $selectedValue) {
                            ForEach(0..<survey.rating.count) { ratingIndex in
                                Text(survey.rating[ratingIndex]).tag(ratingIndex)
                            }
                        }.pickerStyle(MenuPickerStyle())
                    }.padding(.bottom, 20)
                }
                Button {
                    selectedValue = 0
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
    }
}

