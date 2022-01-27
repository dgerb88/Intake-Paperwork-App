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
    
    var lefsView: some View {
        ZStack {
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
                }.padding(.bottom).padding(.horizontal)
            }
        }.frame(width: UIScreen.main.bounds.width)
    }
    
    var body: some View {
        ZStack {
            BackgroundView()
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(5)
                .shadow(radius: 5)
            ZStack {
                ScrollView {
                    VStack {
                        lefsView
                            .onDisappear {
                                let image = lefsView.snapshot()
                                model.PDFimage.append(image)
                                model.PDFfile = model.createPDF(image: image)
                                model.PDFfileArray.append(model.PDFfile!)
                                let mergedFile = model.merge(pdfs: model.PDFfileArray)
                                model.PDFfileArray.removeAll()
                                model.PDFfileArray.append(mergedFile)
                                model.savedPDFimage.append(model.PDFimage)
                                model.PDFfileArrayArray.append(model.PDFfileArray)
                                addItem(image: model.PDFimage, pdf: model.PDFfileArray, name: model.personalName)
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
                        }
                    }
                    
                }
                    
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
                                    ForEach(0..<survey.questions[0].rating.count) { index in
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
            }
            
        }.navigationBarBackButtonHidden(model.pageCount == 1 ? false:true)
        .onAppear {
            model.selectedValue.removeAll()
            model.appendArray(survey.questions.count)
            model.score = 0
        }
        
    }
    func addItem(image: [UIImage], pdf: [NSData], name: String) {
        let newItem = Items(context: viewContext)
        newItem.timestamp = Date()
        newItem.imageArray = image
        newItem.pdfArray = pdf
        newItem.name = name

        do {
            try viewContext.save()
        } catch {
            // Error
        }
    }
}

