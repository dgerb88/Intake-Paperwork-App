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
                            .padding(.horizontal, geo.size.width*1/30)
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
                                                
                                            }.padding(.bottom, 40).padding(.top, 10)
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
                                                }.padding(.leading, 10)
                                                
                                                
                                            }.padding(.vertical, 20)
                                        }
                                    }
                                    else if survey.name == "QuickDash" {
                                        VStack(alignment: .leading) {
                                            HStack {
                                                Spacer()
                                                HStack(spacing: 15) {
                                                    VStack {
                                                        Text("No")
                                                        Text("difficulty")
                                                    }
                                                    VStack {
                                                        Text("Mild")
                                                        Text("difficulty")
                                                    }
                                                    VStack {
                                                        Text("Moderate")
                                                        Text("difficulty")
                                                    }
                                                    VStack {
                                                        Text("Severe")
                                                        Text("difficulty")
                                                    }
                                                    VStack {
                                                        Text("Unable")
                                                        Text("to do")
                                                    }
                                                }.frame(width: 410)
                                            }
                                            ForEach(0..<6) { index in
                                                VStack(alignment: .leading) {
                                                    HStack {
                                                        Text("\(index+1). \(survey.questions[index].title)")
                                                        Spacer()
                                                    
                                                        Picker("", selection: $model.selectedValue[index]) {
                                                            ForEach(0..<survey.questions[index].rating.count) { ratingIndex in
                                                                Text(String(ratingIndex+1)).tag(ratingIndex)
                                                            }
                                                        }.pickerStyle(SegmentedPickerStyle())
                                                            .frame(width: 400)
                                                    
                                                    }
                                                }.padding(.bottom, 20)
                                            }
                                        }
                                    }
                                    else {
                                        Text("Survey not found")
                                    }
                                    Button {
                                        if finished != true {
                                            for index in 0..<model.selectedValue.count {
                                                score += model.selectedValue[index]
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
                        }.padding().padding(.horizontal, geo.size.width*1/30)
                    }.padding(.horizontal, 130)
                }
            }
        }
    }
}

