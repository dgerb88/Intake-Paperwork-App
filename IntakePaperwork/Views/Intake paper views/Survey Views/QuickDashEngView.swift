//
//  QuickDashEngView.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 10/25/21.
//

import SwiftUI

struct QuickDashEngView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var model: SurveyModel
    var survey: Survey
    @State var keyboardChange = false

    
    var quickDashEngView: some View {
        ZStack {
            VStack {
                VStack(alignment: .center) {
                    Text("QuickDASH")
                        .bold()
                        .font(.largeTitle)
                        .padding(.bottom, 30)
                }.padding(.top)
                VStack {
                    Text(survey.description)
                        .font(.headline)
                        .padding(.bottom, 10)
                    Divider()
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
                                        .fixedSize(horizontal: false, vertical: true)
                                    Spacer()
                                    
                                    VStack {
                                        Picker("", selection: $model.selectedValue[index]) {
                                            ForEach(0..<survey.questions[index].rating.count, id: \.self) { ratingIndex in
                                                Text(String(ratingIndex+1)).tag(ratingIndex)
                                            }
                                        }.pickerStyle(SegmentedPickerStyle())
                                            .frame(width: 410)
                                            .onChange(of: model.selectedValue) { newValue in
                                                model.score = 0
                                                for index in 0..<model.selectedValue.count {
                                                    model.score += model.selectedValue[index]+1
                                                }
                                            }
                                        Spacer()
                                    }
                                    
                                }
                            }.padding(.bottom, 10)
                        }
                        Divider()
                            .foregroundColor(.black)
                        HStack {
                            Spacer()
                            HStack {
                                VStack {
                                    Text("Not at all")
                                }
                                VStack {
                                    Text("Slightly")
                                }
                                VStack {
                                    Text("Moderately")
                                }
                                VStack {
                                    Text("Quite a bit")
                                }
                                VStack {
                                    Text("Extremely")
                                }
                            }.frame(width: 410)
                                .padding(.bottom, 10)
                        }
                        HStack {
                            Text("\(7). \(survey.questions[6].title)")
                                .padding(.leading, 5)
                                .fixedSize(horizontal: false, vertical: true)
                            Spacer()
                            
                            VStack {
                                Picker("", selection: $model.selectedValue[6]) {
                                    ForEach(0..<survey.questions[0].rating.count, id: \.self) { ratingIndex in
                                        Text(String(ratingIndex+1)).tag(ratingIndex)
                                    }
                                }.pickerStyle(SegmentedPickerStyle())
                                    .frame(width: 400)
                                Spacer()
                            }
                        }
                        Divider()
                            .foregroundColor(.black)
                        HStack {
                            Spacer()
                            HStack {
                                VStack {
                                    Text("Not limited")
                                    Text("at all")
                                }
                                VStack {
                                    Text("Slightly")
                                    Text("limited")
                                }
                                VStack {
                                    Text("Moderately")
                                    Text("limited")
                                }
                                VStack {
                                    Text("Very")
                                    Text("limited")
                                }
                                VStack {
                                    Text("Unable")
                                    Text("to do")
                                }
                            }.frame(width: 410)
                                .padding(.vertical, 10)
                        }
                        HStack {
                            Text("\(8). \(survey.questions[7].title)")
                                .padding(.leading, 5)
                                .fixedSize(horizontal: false, vertical: true)
                            Spacer()
                            
                            VStack {
                                Picker("", selection: $model.selectedValue[7]) {
                                    ForEach(0..<survey.questions[0].rating.count, id: \.self) { ratingIndex in
                                        Text(String(ratingIndex+1)).tag(ratingIndex)
                                    }
                                }.pickerStyle(SegmentedPickerStyle())
                                    .frame(width: 400)
                                Spacer()
                            }
                        }
                        Divider()
                            .foregroundColor(.black)
                    }
                    VStack(alignment: .leading) {
                        Text("Please rate the severity of the following symptoms in the last week:")
                            .bold()
                            .padding(.vertical, 20)
                        
                        HStack {
                            Spacer()
                            HStack {
                                Text("None").padding(.leading, 20)
                                Text("Mild").padding(.trailing, 10).padding(.leading, 30)
                                Text("Moderate").padding(.trailing, 20).padding(.leading, 10)
                                Text("Severe").padding(.trailing, 10)
                                Text("Extreme")
                            }.frame(width: 410)
                                .padding(.bottom, 10)
                        }
                        HStack {
                            Text("\(9). \(survey.questions[8].title)")
                                .padding(.leading, 5)
                            Spacer()
                            
                            VStack {
                                Picker("", selection: $model.selectedValue[8]) {
                                    ForEach(0..<survey.questions[0].rating.count, id: \.self) { ratingIndex in
                                        Text(String(ratingIndex+1)).tag(ratingIndex)
                                    }
                                }.pickerStyle(SegmentedPickerStyle())
                                    .frame(width: 400)
                                
                            }
                        }.padding(.bottom, 20)
                        HStack {
                            Text("\(10). \(survey.questions[9].title)")
                                .padding(.leading, 5)
                            Spacer()
                            
                            VStack {
                                Picker("", selection: $model.selectedValue[9]) {
                                    ForEach(0..<survey.questions[0].rating.count, id: \.self) { ratingIndex in
                                        Text(String(ratingIndex+1)).tag(ratingIndex)
                                    }
                                }.pickerStyle(SegmentedPickerStyle())
                                    .frame(width: 400)
                                    .padding(.bottom, 20)
                            }
                        }
                        Divider()
                        HStack {
                            Spacer()
                            HStack {
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
                                    Text("So much it")
                                    Text("prevents")
                                    Text("sleep")
                                }
                            }.frame(width: 410)
                                .padding(.vertical, 10)
                        }
                        HStack {
                            Text("\(11). \(survey.questions[10].title)")
                                .padding(.leading, 5)
                                .fixedSize(horizontal: false, vertical: true)
                            Spacer()
                            
                            VStack {
                                Picker("", selection: $model.selectedValue[10]) {
                                    ForEach(0..<survey.questions[0].rating.count, id: \.self) { ratingIndex in
                                        Text(String(ratingIndex+1)).tag(ratingIndex)
                                    }
                                }.pickerStyle(SegmentedPickerStyle())
                                    .frame(width: 400)
                                    .padding(.bottom, 50)
                            }
                        }
                        HStack {
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
                            Text("Score: \(model.scoringDash(num1: model.score))")
                                .font(.title)
                                .padding()
                        }
                        
                        .padding(.vertical, 5)
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
                        quickDashEngView
                            .onDisappear {
                                let image = quickDashEngView.snapshot()
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
                                Text("Finish")
                                    .foregroundColor(.white)
                                    .font(.title)
                                    .bold()
                            }.padding().padding(.bottom)
                        }.navigationBarBackButtonHidden(model.eval)
                    }
                }
            }.padding(.top, UIScreen.main.bounds.width == 768 || UIScreen.main.bounds.width == 810 ? 0 : 15)
        }
            .padding(.bottom, keyboardChange ? UIScreen.main.bounds.height*3/15 : 0)
            .onAppear {
                model.score = 0
                model.selectedValue.removeAll()
                model.appendArray(survey.questions.count)
            }
        
    }
}


