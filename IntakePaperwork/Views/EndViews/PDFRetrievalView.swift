//
//  PDFRetrievalView.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 11/16/21.
//

import SwiftUI

struct PDFRetrievalView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "timestamp", ascending: false)]) var CoreDataItems: FetchedResults<Items>
    
    @EnvironmentObject var model: SurveyModel
    @State var showSheetView = false
    
    var body: some View {
        ZStack {
            BackgroundView()
                .frame(width: UIScreen.main.bounds.width)
            ZStack {
                VStack {
                    List {
                        ForEach(CoreDataItems) { item in
                            NavigationLink {
                                PDFViewer(image: item.imageArray, nsDataArray: item.pdfArray)
                            } label : {
                                HStack {
                                    if item.name != "" {
                                        Text(item.name)
                                            .padding(.trailing, 15)
                                    }
                                    Text("\((item.timestamp?.addingTimeInterval(1))!, style: .date)")
                                        .padding(.trailing, 5)
                                    Text("\((item.timestamp?.addingTimeInterval(1))!, style: .time)")
                                }
                            }
                        }
                    }
                    HStack {
                        Button {
                            for item in CoreDataItems {
                                viewContext.delete(item)
                            }
                            try! viewContext.save()
                        } label: {
                            VStack {
                                Image(systemName: "trash")
                                    .resizable(resizingMode: .tile)
                                    .frame(width: 22, height: 30)
                                    .foregroundColor(.white)
                                Text("Delete all")
                                    .foregroundColor(.white)
                            }.padding(.leading, 40)
                        }
                        Spacer()

                    }.padding()
                }.navigationBarBackButtonHidden(true)
            }.padding(.top)
        }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Saved PDF's")
                        .bold()
                        .foregroundColor(.white)
                        .font(.largeTitle)
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        model.viewSelectionInt = nil
                    } label: {
                        HStack {
                            Image(systemName: "chevron.left")
                                .font(Font.body.weight(.bold))
                            Text("Back")
                                .font(Font.body.weight(.semibold))
                        }
                    }
                }
            }

    }
}


