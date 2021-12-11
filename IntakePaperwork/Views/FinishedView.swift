//
//  FinishedView.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 12/7/21.
//

import SwiftUI

struct FinishedView: View {
    
    @EnvironmentObject var model: SurveyModel
    @State var showSheetView = false
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                        .cornerRadius(5)
                        .frame(height: UIScreen.main.bounds.height*5/6)
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


