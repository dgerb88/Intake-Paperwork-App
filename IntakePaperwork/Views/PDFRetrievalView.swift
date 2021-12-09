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
                        if model.savedPDFimage != [[UIImage]]() {
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
                        else {
                            Text("No PDF's files available")
                        }
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


