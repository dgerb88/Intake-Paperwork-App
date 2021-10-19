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
        ScrollView {
            LazyVStack {
                ForEach(model.surveys) { survey in
                    if survey.language == language {
                        NavigationLink {
                            SurveyView(survey: survey)
                                .onAppear {
                                    model.appendArray(survey.questions.count)
                                }
                        } label: {
                            Text(survey.name)
                                .foregroundColor(.black)
                        }
                    }
                }
            }
        }
    }
}
struct FunctionalSurveyListView_Previews: PreviewProvider {
    static var previews: some View {
        FunctionalSurveyListView(language: "English")
            .environmentObject(SurveyModel())
    }
}
