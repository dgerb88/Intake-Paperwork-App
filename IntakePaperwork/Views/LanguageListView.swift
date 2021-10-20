//
//  ContentView.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 10/16/21.
//

import SwiftUI

struct LanguageListView: View {
    
    @EnvironmentObject var model: SurveyModel
    
    init() {
            UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "Georgia-Bold", size: 30)!]
        }
    
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle()
                    .aspectRatio(contentMode: .fill)
                    .foregroundColor(Color.init(.sRGB, red: 0.3, green: 0.7, blue: 1, opacity: 0.6))
                    .ignoresSafeArea()
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

                    }.navigationBarTitle("Select language", displayMode: .inline)
                        .padding(.top, 30)
                }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct LanguageListView_Previews: PreviewProvider {
    static var previews: some View {
        LanguageListView()
            .environmentObject(SurveyModel())
    }
}
