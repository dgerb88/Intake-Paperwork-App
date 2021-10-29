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
            ZStack {
                BackgroundView()
                GeometryReader { geo in
                    VStack {
                       NavigationLink {
                            FunctionalSurveyListView(language: "English")
                        } label: {
                            RectangleView(language: "English")
                                .padding()
                                .padding(.horizontal, geo.size.width*3/18)
                                .foregroundColor(.black)
                        }
                        
                        NavigationLink {
                            FunctionalSurveyListView(language: "Spanish")
                        } label: {
                            RectangleView(language: "Spanish")
                                .padding()
                                .foregroundColor(.black)
                                .padding(.horizontal, geo.size.width*3/18)
                        }
                        Spacer()

                    }.padding(.top, 30)
                        
                }
            }.navigationBarTitleDisplayMode( .inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Select Language")
                            .bold()
                            .foregroundColor(.white)
                            .font(.largeTitle)
                    }
                }
        }.navigationViewStyle(StackNavigationViewStyle())
            .accentColor(.white)
    }
}

struct LanguageListView_Previews: PreviewProvider {
    static var previews: some View {
        LanguageListView()
            .environmentObject(SurveyModel())
    }
}
