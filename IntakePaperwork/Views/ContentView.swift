//
//  ContentView.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 10/16/21.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: SurveyModel
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink {
                    EnglishListView()
                } label: {
                    RectangleView(language: "English")
                        .padding()
                        .foregroundColor(.black)
                }
                NavigationLink {
                    SpanishListView()
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(SurveyModel())
    }
}
