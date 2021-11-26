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
                    VStack(alignment: .leading) {
                            ScrollView {
                                LazyVStack(alignment: .leading, spacing: 30) {
                                    if model.eval == true {
                                        if model.showMedicalHistory == true && model.includeMedicalHistory == true {
                                            MedicalHistoryView()
                                        }
                                        if model.showInfoAndPolicies == true && model.includeInformationAndPolicies == true {
                                            InformationAndPoliciesView()
                                        }
                                        if model.showDryNeedling == true && model.includeDryNeedlingConsent == true {
                                            DryNeedlingConsentView()
                                        }
                                        if model.showPrivacyPolicy == true && model.includePrivacyPolicy == true {
                                            PrivacyPolicyView()
                                        }
                                        if model.showInsuranceIntake == true && model.includeInsuranceIntake == true {
                                            InsuranceIntakeView()
                                        }
                                    }
                                    if survey.name == "LEFS" {
                                        LefsView(survey: survey)
                                    }
                                    else if survey.name == "Back Index" {
                                        BackIndexView(survey: survey)
                                    }
                                    else if survey.name == "QuickDash" && survey.language == "English" {
                                        QuickDashEngView(survey: survey)
                                    }
                                    else if survey.name == "QuickDash" && survey.language == "Spanish" {
                                        QuickDashSpanView(survey: survey)
                                    }
                                    else if survey.name == "Neck Disability Index" {
                                        NDIView(survey: survey)
                                    }
                                    else {
                                        Text("Survey not found")
                                    }
                                }
                                .onDisappear {
                                    model.finishedSurvey = false
                                    model.selectedValue.removeAll()

                                }
                                
                                
                            }.navigationBarTitleDisplayMode(.inline)
                            .toolbar {
                                ToolbarItem(placement: .principal) {
                                    Text("Intake Paperwork")
                                        .bold()
                                        .foregroundColor(.white)
                                        .font(.largeTitle)
                                }
                            }
                    }.frame(width: UIScreen.main.bounds.width-10)
                        .padding()
                
            }
        }
    }
    
}

