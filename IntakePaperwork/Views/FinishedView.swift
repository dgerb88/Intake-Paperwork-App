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
                        Image(systemName: "house")
                            .resizable(resizingMode: .tile)
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                    }.padding().padding(.leading, 40)
                    Spacer()
                    Button {
                        showSheetView = true
                    } label: {
                        Image(systemName: "arrow.up.doc")
                            .resizable(resizingMode: .tile)
                            .frame(width: 30, height: 40)
                            .foregroundColor(.white)
                    }.padding().padding(.trailing, 40)
                }

            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct FinishedView_Previews: PreviewProvider {
    static var previews: some View {
        FinishedView()
    }
}
