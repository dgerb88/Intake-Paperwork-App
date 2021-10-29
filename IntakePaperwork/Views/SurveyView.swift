//
//  SurveyView.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 10/16/21.
//

import SwiftUI

struct SurveyView: View {
    
    @EnvironmentObject var model: SurveyModel
    var survey: Survey
    
    var body: some View {
        ZStack {
            BackgroundView()
            if model.selectedValue == [Int]() {
                ProgressView()
            }
            else {
                GeometryReader { geo in
                    VStack(alignment: .leading) {
                            ScrollView {
                                LazyVStack(alignment: .leading, spacing: 30) {
                                    InformationAndPoliciesView()
                                    if survey.name == "LEFS" {
                                        LefsView(survey: survey)
                                    }
                                    else if survey.name == "Back Index" {
                                        BackIndexView(survey: survey)
                                    }
                                    else if survey.name == "QuickDash" && survey.language == "English" {
                                        QuickDashEngView(survey: survey)
                                    }
                                    
                                    else {
                                        Text("Survey not found")
                                    }
                                }
                                .onDisappear {
                                    model.finishedSurvey = false
                                    model.selectedValue.removeAll()

                                }
                                
                                
                            }.navigationBarTitleDisplayMode( .inline)
                            .toolbar {
                                ToolbarItem(placement: .principal) {
                                    Text("Intake Paperwork")
                                        .bold()
                                        .foregroundColor(.white)
                                        .font(.largeTitle)
                                }
                            }
                        }.padding(.horizontal, geo.size.width*4/30).padding(.top, 30)
                }
            }
        }
    }
}

