//
//  PDFRetrievalView.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 11/16/21.
//

import SwiftUI

struct PDFRetrievalView: View {
    
    @EnvironmentObject var model: SurveyModel
    @State var showSheetView = false 
    
    var body: some View {
        ZStack {
            BackgroundView()
                .frame(width: UIScreen.main.bounds.width)
            ZStack {
                VStack {
                    List {
                        if model.savedPDFimage != [[UIImage]]() && model.PDFfileArrayArray != [[NSData]]() {
                            ForEach(0..<model.savedPDFimage.count, id: \.self) { index in
                                NavigationLink {
                                    PDFViewer(image: model.savedPDFimage[index], nsDataArray: model.PDFfileArrayArray[index])
                                } label : {
                                    HStack {
                                        Text(Date().addingTimeInterval(600), style: .date)
                                            .padding(.trailing)
                                        Text(Date().addingTimeInterval(600), style: .time)
                                    }
                                }
                            }
                        }
                        else {
                            Text("No PDF's files available")
                        }
                    }
                    HStack {
                        Button {
                            model.PDFfileArrayArray.removeAll()
                            model.savedPDFimage.removeAll()
                        } label: {
                            Image(systemName: "trash")
                                .resizable(resizingMode: .tile)
                                .frame(width: 22, height: 30)
                                .foregroundColor(.white)
                                .padding(.leading, 40)
                                .padding(.bottom, 5)
                        }
                        Spacer()

                    }.padding()
                }
            }.padding(.top)
        }.navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Saved PDF's")
                        .bold()
                        .foregroundColor(.white)
                        .font(.largeTitle)
                }
            }

    }
}


