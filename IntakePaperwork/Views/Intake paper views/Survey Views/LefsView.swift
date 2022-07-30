//
//  LefsView.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 10/25/21.
//

import SwiftUI

struct LefsView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var model: SurveyModel
    var survey: Survey
    @State var keyboardChange = false
    
    var lefsView: some View {
            VStack {
                VStack(alignment: .center) {
                    Text("Lower Extremity Functional Scale")
                        .bold()
                        .font(.largeTitle)
                        .padding(.bottom, 20)
                }.padding(.top)
                VStack(alignment: .leading) {
                    Text(survey.description)
                        .font(.headline)
                        .padding(.bottom, 10)
                        .fixedSize(horizontal: false, vertical: true)
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
                    ForEach(0..<survey.questions[0].rating.count, id: \.self) { index in
                        Text(survey.questions[0].rating[index])
                            .font(.subheadline)
                            .padding(.bottom, 1)
                            .padding(.leading, 20)
                    }
                    Divider()
                    ForEach(0..<survey.questions.count, id: \.self) { index in
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
                                    model.score = 0
                                    for index in 0..<model.selectedValue.count {
                                        model.score += model.selectedValue[index]
                                    }
                                }
                        }.padding(.bottom, 40).padding(.top, 10)
                    }
                    HStack {
                        if survey.language == "English" {
                            if model.eval == false {
                                Text("Name:")
                                TextField("", text: $model.personalName)
                                    .frame(width: 300)
                                    .padding(.horizontal, 20)
                                    .accentColor(.black)
                                    .textFieldStyle(.roundedBorder)
                                    .onTapGesture {
                                        keyboardChange = true
                                    }
                            }
                            Spacer()
                            Text("Score: \(model.score)/80")
                                .font(.title)
                                .padding()
                        }
                        else {
                            if model.eval == false {
                                Text("Nombre:")
                                TextField("Nombre", text: $model.personalName)
                                    .frame(width: 300)
                                    .padding(.horizontal, 20)
                                    .accentColor(.black)
                                    .textFieldStyle(.roundedBorder)
                                    .onTapGesture {
                                        keyboardChange = true
                                    }
                            }
                            Spacer()
                            Text("Puntuación: \(model.score)/80")
                                .font(.title)
                                .padding()
                        }
                    }
                }
                    .padding(.bottom)
                    .padding(.horizontal)
            }.frame(width: UIScreen.main.bounds.width)
    }
    
    var body: some View {
        ZStack {
            BackgroundView()
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(5)
                .shadow(radius: 5)
                .padding(.top, UIScreen.main.bounds.width == 768 || UIScreen.main.bounds.width == 810 || UIScreen.main.bounds.width == 744 ? 10 : 15)
            ZStack {
                ScrollView {
                    VStack {
                        lefsView
                            .onDisappear {
                                let image = lefsView.snapshot()
                                model.PDFimage.append(image)
                                model.PDFfile = model.createPDF(image: image)
                                model.PDFfileArray.append(model.PDFfile!)
                                
                            }
                        NavigationLink {
                            FinishedView(survey: survey)
                        } label: {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.green)
                                    .frame(height: 48)
                                    .cornerRadius(10)
                                    .shadow(radius: 1)
                                if survey.language == "English" {
                                    Text("Finish")
                                        .foregroundColor(.white)
                                        .font(.title)
                                        .bold()
                                }
                                else {
                                    Text("Terminar")
                                        .foregroundColor(.white)
                                        .font(.title)
                                        .bold()
                                }
                            }.padding().padding(.bottom)
                        }
                    }
                    
                }.padding(.top)
                    VStack(alignment: .leading) {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.white)
                            VStack {
                                VStack(alignment: .center) {
                                    Text("Lower Extremity Functional Scale")
                                        .bold()
                                        .font(.largeTitle)
                                        .padding(.bottom, 30)
                                }.padding(.top)
                                VStack(alignment: .leading) {
                                    Text(survey.description)
                                        .font(.headline)
                                        .padding(.bottom, 10)
                                        .fixedSize(horizontal: false, vertical: true)
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
                                    ForEach(0..<survey.questions[0].rating.count, id: \.self) { index in
                                        Text(survey.questions[0].rating[index])
                                            .font(.subheadline)
                                            .padding(.bottom, 1)
                                            .padding(.leading, 20)
                                    }
                                    Divider()
                                }
                            }.padding(.horizontal).padding(.top)
                        }.frame(height: 350)
                        Spacer()
                    }
                    .padding(.top, UIScreen.main.bounds.width == 768 || survey.language == "Spanish" || UIScreen.main.bounds.width == 744 ? 10:0)

            }.padding(.top, UIScreen.main.bounds.width == 768 || UIScreen.main.bounds.width == 810 || UIScreen.main.bounds.width == 744 ? 10 : 15)
            
        }
            .padding(.bottom, keyboardChange ? UIScreen.main.bounds.height*3/15 : 0)
            .navigationBarBackButtonHidden(model.eval)
            .onAppear {
                model.selectedValue.removeAll()
                model.appendArray(survey.questions.count)
                model.score = 0
            }
    }
    
}

