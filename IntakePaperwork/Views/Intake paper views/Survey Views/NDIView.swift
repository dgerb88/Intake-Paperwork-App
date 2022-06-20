//
//  NDIView.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 11/1/21.
//

import SwiftUI

struct NDIView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var model: SurveyModel
    var survey: Survey
    @State var keyboardChange = false

    
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
                    ForEach(0..<survey.questions.count, id: \.self) { index in
                        Text("\(survey.questions[index].title)")
                            .font(.title)
                            .fixedSize(horizontal: false, vertical: true)
                        Picker("", selection: $model.selectedValue[index]) {
                            ForEach(0..<survey.questions[index].rating.count, id: \.self) { ratingIndex in
                                Text(String(ratingIndex)).tag(ratingIndex)
                            }
                        }.pickerStyle(SegmentedPickerStyle())
                            .onChange(of: model.selectedValue) { newValue in
                                model.score = 0
                                for index in 0..<model.selectedValue.count {
                                    model.score += model.selectedValue[index]
                                }
                            }
                        ForEach(0..<survey.questions[index].rating.count, id: \.self) { ratingIndex in
                            Text("\(ratingIndex) - \(survey.questions[index].rating[ratingIndex])").tag(ratingIndex)
                                .fixedSize(horizontal: false, vertical: true)
                        }.padding(.leading, 10)
                        Divider().padding(.bottom)
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
                            Text("Score: \(model.score)/50")
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
                            Text("Puntuación: \(model.score)/50")
                                .font(.title)
                                .padding()
                        }
                    }
                }.padding(.bottom).padding(.horizontal)
            }
        }.frame(width: UIScreen.main.bounds.width)
        
    }
    
    var body: some View {
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
                        }.navigationBarBackButtonHidden(model.eval)
                    }
                }.onAppear {
                    model.score = 0
                    model.selectedValue.removeAll()
                    model.appendArray(survey.questions.count)
                }
            }.padding(.top, UIScreen.main.bounds.width == 768 || UIScreen.main.bounds.width == 810 ? 0 : 15)
        }
            .padding(.bottom, keyboardChange ? UIScreen.main.bounds.height*3/10 : 0)
    }
}

