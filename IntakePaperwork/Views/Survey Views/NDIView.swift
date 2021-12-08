//
//  NDIView.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 11/1/21.
//

import SwiftUI

struct NDIView: View {
    
    @EnvironmentObject var model: SurveyModel
    var survey: Survey
    
    var ndiView: some View {
        ZStack {
            VStack {
                VStack(alignment: .center) {
                    Text("Neck Disability Index")
                        .bold()
                        .font(.largeTitle)
                        .padding(.bottom, 30)
                }.padding(.top)
                VStack(alignment: .leading) {
                    Text(survey.description)
                        .font(.headline)
                        .padding(.bottom, 10)
                        .fixedSize(horizontal: false, vertical: true)
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
                                model.score = 0
                                for index in 0..<model.selectedValue.count {
                                    model.score += model.selectedValue[index]
                                }
                            }
                        ForEach(0..<survey.questions[index].rating.count) { ratingIndex in
                            Text("\(ratingIndex) - \(survey.questions[index].rating[ratingIndex])").tag(ratingIndex)
                        }.padding(.leading, 10)
                        Divider().padding(.bottom)
                    }
                    HStack {
                        Spacer()
                        if survey.language == "English" {
                            Text("Score: \(model.score)/50")
                                .foregroundColor(.black)
                                .font(.title)
                                .padding()
                        }
                        else {
                            Text("Puntuación: \(model.score)/50")
                                .foregroundColor(.black)
                                .font(.title)
                                .padding()
                        }
                    }
                }.padding(.bottom).padding(.horizontal)
            }
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
            ZStack {
                BackgroundView()
                ScrollView {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.white)
                            .cornerRadius(5)
                            .shadow(radius: 5)
                        VStack {
                            ndiView.onDisappear {
                                let image = ndiView.snapshot()
                                model.PDFimage.append(image)
                            }

                            NavigationLink {
                                FinishedView()
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
                                }.padding().padding(.bottom)
                            }.navigationBarBackButtonHidden(true)
                        }
                    }.onAppear {
                        model.score = 0
                        model.selectedValue.removeAll()
                        model.appendArray(survey.questions.count)
                    }
                }
            }
        }
    }
}

