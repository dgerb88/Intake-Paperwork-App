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
    
    var lefsView: some View {
        ZStack {
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
                                ForEach(0..<5) { ratingIndex in
                                    Text(String(ratingIndex)).tag(ratingIndex)
                                }
                            }.pickerStyle(SegmentedPickerStyle())
                                .onChange(of: model.selectedValue) { newValue in
                                    model.finishedSurvey = false
                                    model.score = 0
                                    for index in 0..<model.selectedValue.count {
                                        model.score += model.selectedValue[index]
                                    }
                                }
                            
                        }.padding(.bottom, 40).padding(.top, 10)
                    }
                    HStack {
                        Spacer()
                        Text("Score: \(model.score)/80")
                            .font(.title)
                        .padding()
                    }
                    Button {
                        let image = lefsView.snapshot()
                        model.PDFimage.append(image)
                        model.finishedSurvey = true
                    } label: {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.green)
                                .frame(height: 48)
                                .cornerRadius(10)
                                .shadow(radius: 1)
                            Text("Finish")
                                .foregroundColor(.white)
                                .font(.title)
                                .bold()
                        }
                    }.disabled(model.finishedSurvey ? true : false)
                
            }.padding()
        }.frame(width: UIScreen.main.bounds.width)
    }

    var body: some View {
        if model.selectedValue == [Int]() {
            ProgressView().onAppear {
                model.selectedValue.removeAll()
                model.appendArray(survey.questions.count)
            }
        }
        else {
            ScrollView {
                VStack {
                    lefsView.onAppear {
                        model.score = 0
                        model.finishedSurvey = false
                        model.selectedValue.removeAll()
                        model.appendArray(survey.questions.count)
                    }
                    NavigationLink {
                        PDFViewer()
                    } label: {
                        Text("Push me")
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

