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
                Rectangle()
                    .foregroundColor(.white)
                VStack {
                    List {
                        ForEach(0..<model.savedPDFimage.count) { index in
                            NavigationLink {
                                PDFViewer(image: model.savedPDFimage[index])
                            } label : {
                                HStack {
                                    Text(Date().addingTimeInterval(600), style: .date)
                                        .padding(.trailing)
                                    Text(Date().addingTimeInterval(600), style: .time)
                                }
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
                        }.padding().padding(.leading, 40)
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
                        }.padding().padding(.trailing, 40)
                        
                    }

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


