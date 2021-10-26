//
//  EnlglishListView.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 10/16/21.
//

import SwiftUI

struct FunctionalSurveyListView: View {
    
    @EnvironmentObject var model: SurveyModel
    
    var language: String
    
    var body: some View {
        ZStack {
            BackgroundView()
            ScrollView {
                GeometryReader { geo in
                    LazyVStack(spacing: 20) {
                        ForEach(model.surveys) { survey in
                            if survey.language == language {
                                NavigationLink {
                                    SurveyView(survey: survey)
                                        .onAppear {
                                            model.appendArray(survey.questions.count)
                                        }
                                } label: {
                                        ZStack {
                                            Rectangle()
                                                .foregroundColor(.white)
                                                .cornerRadius(5)
                                                .shadow(radius: 5)
                                                .frame(height: 75)
                                                .padding(.horizontal, geo.size.width*2/9)
                                            Text(survey.name)
                                                .font(.title)
                                                .bold()
                                                .foregroundColor(.black)
                                        }
                                }
                            }
                        }
                    }.padding()
                        .padding(.top, 30)
                }
            }.navigationBarTitle("Select Outcome Measure", displayMode: .inline)
        }
    }
}
struct FunctionalSurveyListView_Previews: PreviewProvider {
    static var previews: some View {
        FunctionalSurveyListView(language: "English")
            .environmentObject(SurveyModel())
    }
}