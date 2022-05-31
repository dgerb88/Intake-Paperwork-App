//
//  FinishedView.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 12/7/21.
//

import SwiftUI

struct FinishedView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var model: SurveyModel
    @State var showSheetView = false
    var survey: Survey
    @State var progressView = 1
    
    var body: some View {
        if progressView == 1 {
            ProgressView("Compiling...")
                .progressViewStyle(CircularProgressViewStyle(tint: .black))
                .foregroundColor(.black)
                .onAppear(perform: {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                        progressView = 0
                    }
                })
                .onDisappear() {
                    let mergedFile = model.merge(pdfs: model.PDFfileArray)
                    model.PDFfileArray.removeAll()
                    model.PDFfileArray.append(mergedFile)
                    model.savedPDFimage.append(model.PDFimage)
                    model.PDFfileArrayArray.append(model.PDFfileArray)
                    addItem(image: model.PDFimage, pdf: model.PDFfileArray, name: model.personalName)
                }
        }
        else {
            ZStack {
                BackgroundView()
                VStack {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.white)
                            .cornerRadius(5)
                            .frame(height: UIScreen.main.bounds.height*5/6)
                        if survey.language == "English" {
                            Text("Thank you for completing your pre-appointment forms.  Please return this tablet to the front desk.")
                                .bold()
                                .font(.largeTitle)
                                .multilineTextAlignment(.center)
                                .padding(.bottom, 200)
                                .padding(.horizontal, 50)
                                .sheet(isPresented: $showSheetView) {
                                    ShareSheet(activityItems: model.PDFfileArray)
                                }
                        }
                        else {
                            Text("Gracias por llenar estos formularios en preparación de su cita.  El favor de devolver esta tableta al mostrador.")
                                .bold()
                                .font(.largeTitle)
                                .multilineTextAlignment(.center)
                                .padding(.bottom, 200)
                                .padding(.horizontal, 50)
                                .sheet(isPresented: $showSheetView) {
                                    ShareSheet(activityItems: model.PDFfileArray)
                                }
                        }
                    }
                    HStack {
                        Button {
                            model.viewSelectionInt = nil
                        } label: {
                            VStack {
                                Image(systemName: "house")
                                    .resizable(resizingMode: .tile)
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.white)
                                Text("Home")
                                    .foregroundColor(.white)
                            }
                        }.padding(.top).padding(.leading, 40)
                        Spacer()
                        NavigationLink {
                            PDFViewer(image: model.PDFimage, nsDataArray: model.PDFfileArray)
                        } label: {
                            VStack {
                                Image(systemName: "doc")
                                    .resizable(resizingMode: .tile)
                                    .frame(width: 22, height: 30)
                                    .foregroundColor(.white)
                                Text("View")
                                    .foregroundColor(.white)
                            }
                            
                        }.padding(.top)
                        Spacer()
                        Button {
                            showSheetView = true
                        } label: {
                            VStack {
                                Image(systemName: "arrow.up.doc")
                                    .resizable(resizingMode: .tile)
                                    .frame(width: 22, height: 30)
                                    .foregroundColor(.white)
                                Text("Share")
                                    .foregroundColor(.white)
                            }
                        }.padding(.top).padding(.trailing, 40)
                    }
                    
                }
            }
            .navigationBarBackButtonHidden(true)
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


