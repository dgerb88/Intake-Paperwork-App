//
//  ContentView.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 10/16/21.
//

import SwiftUI

struct LanguageListView: View {
    
    @EnvironmentObject var model: SurveyModel
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink {
                    FunctionalSurveyListView(language: "English")
                } label: {
                    RectangleView(language: "English")
                        .padding()
                        .foregroundColor(.black)
                }
                NavigationLink {
                    FunctionalSurveyListView(language: "Spanish")
                } label: {
                    RectangleView(language: "Spanish")
                        .padding()
                        .foregroundColor(.black)
                }
                Spacer()

            }.navigationBarTitle("Select language")
                .padding(.top)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct LanguageListView_Previews: PreviewProvider {
    static var previews: some View {
        LanguageListView()
            .environmentObject(SurveyModel())
    }
}
