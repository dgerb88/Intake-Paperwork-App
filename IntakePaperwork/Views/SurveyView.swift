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
    @State var score = 0
    @State var finished = false
    var truth = true
    
    var body: some View {
        ZStack {
            BackgroundView()
            if model.selectedValue == [Int]() {
                ProgressView()
            }
            else {
                GeometryReader { geo in
                    ZStack {
                        Rectangle()
                            .foregroundColor(.white)
                            .cornerRadius(5)
                            .shadow(radius: 5)
                        VStack(alignment: .leading) {
                            Text(survey.description)
                                .font(.headline)
                                .padding(.bottom, 10)
                            
                            if survey.name == "LEFS" {
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
                            }
                            
                            Divider()
                            ScrollView {
                                VStack(alignment: .leading) {
                                    
                                    if survey.name == "LEFS" {
                                        LefsView(survey: survey)
                                    }
                                    else if survey.name == "Back Index" {
                                        BackIndexView(survey: survey)
                                    }
                                    else if survey.name == "QuickDash" && survey.language == "English" {
                                        QuickDashEngView(survey: survey)
                                    }
                                    
                                    else {
                                        Text("Survey not found")
                                    }
                                    Button {
                                        if finished != true {
                                            for index in 0..<model.selectedValue.count {
                                                if survey.name == "QuickDash" {
                                                    score += model.selectedValue[index] + 1
                                                }
                                                else {
                                                    score += model.selectedValue[index]

                                                }
                                            }
                                        }
                                        finished = true
                                        
                                    } label: {
                                        ZStack {
                                            Rectangle()
                                                .foregroundColor(.green)
                                                .frame(height: 48)
                                                .cornerRadius(10)
                                                .shadow(radius: 1)
                                            if finished && survey.name == "LEFS" {
                                                Text("Score: \(score)/80")
                                                    .foregroundColor(.white)
                                                    .bold()
                                            }
                                            else if finished && survey.name == "Back Index" {
                                                Text("Score: \(Int(Double(score*100/50)))%")
                                                    .foregroundColor(.white)
                                                    .bold()
                                            }
                                            else if finished && survey.name == "QuickDash" {
                                                Text("Score: \(Int(Double(score/11)-1)*25)/100")
                                                    .foregroundColor(.white)
                                                    .bold()
                                            }
                                            else {
                                                Text("Finish")
                                                    .foregroundColor(.white)
                                                    .bold()
                                            }
                                        }
                                        
                                    }.padding(.top, 5).padding(.bottom, 5)
                                }
                                .onDisappear {
                                    finished = false
                                }
                                
                                
                            }.navigationTitle(survey.name).padding(.bottom, 20).onDisappear {
                                model.selectedValue.removeAll()
                            }
                        }.padding()
                    }.padding(.horizontal, geo.size.width*4/30)
                }
            }
        }
    }
}

