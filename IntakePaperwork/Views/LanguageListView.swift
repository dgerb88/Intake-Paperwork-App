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
                    VStack {
                       NavigationLink {
                            FunctionalSurveyListView(language: "English")
                        } label: {
                            RectangleView(language: "English")
                                .padding()
                                .frame(width: UIScreen.main.bounds.width-40)
                                .foregroundColor(.black)
                        }
                        
                        NavigationLink {
                            FunctionalSurveyListView(language: "Spanish")
                        } label: {
                            RectangleView(language: "Spanish")
                                .padding()
                                .foregroundColor(.black)
                                .frame(width: UIScreen.main.bounds.width-40)
                        }
                        SettingsView()
                            .padding()
                            .padding(.top, 100)
                            .frame(width: UIScreen.main.bounds.width-40, height: UIScreen.main.bounds.height*7/12)
                        Spacer()
                    }.padding(.top, 20)
                        
                
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
