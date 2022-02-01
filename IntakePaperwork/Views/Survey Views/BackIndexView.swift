//
//  BackIndexView.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 10/25/21.
//

import SwiftUI

struct BackIndexView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var model: SurveyModel
    var survey: Survey
    
    var backIndexView: some View {
        ZStack {
            VStack {
                VStack(alignment: .center) {
                    VStack(alignment: .center) {
                        Text("Back Index")
                            .bold()
                            .font(.largeTitle)
                            .padding(.bottom, 30)
                    }.padding(.top)
                }
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
                            Text(survey.questions[index].rating[ratingIndex]).tag(ratingIndex)
                        }.padding(.leading, 10)
                        Divider().padding(.bottom)
                    }
                    
                    HStack {
                        Spacer()
                        Text("Score: \(Int(Double(model.score*100/50)))%")
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
            ScrollView {
                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                        .cornerRadius(5)
                        .shadow(radius: 5)
                    VStack {
                        backIndexView
                            .onDisappear {
                                let image = backIndexView.snapshot()
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
                        }.navigationBarBackButtonHidden(model.pageCount == 1 ? false:true)
                    }
                }.onAppear {
                    model.score = 0
                    model.selectedValue.removeAll()
                    model.appendArray(survey.questions.count)
                }
            }
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

