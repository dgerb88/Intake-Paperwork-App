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
            Rectangle()
                .foregroundColor(Color.init(.sRGB, red: 0.92941, green: 0.92941, blue: 0.92941, opacity: 1))
                .cornerRadius(5)
                .shadow(radius: 5)
                .padding(.top)
            if model.selectedValue == [Int]() {
                ProgressView()
            }
            else {
                    VStack(alignment: .leading) {
                            ScrollView {
                                LazyVStack(alignment: .leading, spacing: 30) {
                                    if model.eval == true {
                                        if model.showMedicalHistory == true && model.includeMedicalHistory == true {
                                            ZStack {
                                                Rectangle()
                                                    .foregroundColor(.white)
                                                    .cornerRadius(5)
                                                    .shadow(radius: 5)
                                                MedicalHistoryView(survey: survey)
                                            }.onTapGesture {
                                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                            }
                                        }
                                        if model.showInsuranceIntake == true && model.includeInsuranceIntake == true {
                                            ZStack {
                                                Rectangle()
                                                    .foregroundColor(.white)
                                                    .cornerRadius(5)
                                                    .shadow(radius: 5)
                                                InsuranceIntakeView(survey: survey)
                                            }.onTapGesture {
                                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                            }
                                        }
                                        if model.showInfoAndPolicies == true && model.includeInformationAndPolicies == true {
                                            ZStack {
                                                Rectangle()
                                                    .foregroundColor(.white)
                                                    .cornerRadius(5)
                                                    .shadow(radius: 5)
                                                InformationAndPoliciesView(survey: survey)
                                            }.onTapGesture {
                                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                            }
                                        }
                                        if model.showPrivacyPolicy == true && model.includePrivacyPolicy == true {
                                            ZStack {
                                                Rectangle()
                                                    .foregroundColor(.white)
                                                    .cornerRadius(5)
                                                    .shadow(radius: 5)
                                                PrivacyPolicyView(survey: survey)
                                            }.onTapGesture {
                                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                            }
                                        }
                                        if model.showDryNeedling == true && model.includeDryNeedlingConsent == true {
                                            ZStack {
                                                Rectangle()
                                                    .foregroundColor(.white)
                                                    .cornerRadius(5)
                                                    .shadow(radius: 5)
                                                DryNeedlingConsentView(survey: survey)
                                            }.onTapGesture {
                                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                            }
                                        }                                        
                                    }
                                    if survey.name == "LEFS" {
                                        ZStack {
                                            Rectangle()
                                                .foregroundColor(.white)
                                                .cornerRadius(5)
                                                .shadow(radius: 5)
                                            LefsView(survey: survey)
                                        }
                                    }
                                    else if survey.name == "Back Index" {
                                        ZStack {
                                            Rectangle()
                                                .foregroundColor(.white)
                                                .cornerRadius(5)
                                                .shadow(radius: 5)
                                            BackIndexView(survey: survey)
                                        }
                                    }
                                    else if survey.name == "QuickDash" && survey.language == "English" {
                                        ZStack {
                                            Rectangle()
                                                .foregroundColor(.white)
                                                .cornerRadius(5)
                                                .shadow(radius: 5)
                                            QuickDashEngView(survey: survey)
                                        }
                                    }
                                    else if survey.name == "QuickDash" && survey.language == "Spanish" {
                                        ZStack {
                                            Rectangle()
                                                .foregroundColor(.white)
                                                .cornerRadius(5)
                                                .shadow(radius: 5)
                                            QuickDashSpanView(survey: survey)
                                        }
                                    }
                                    else if survey.name == "Neck Disability Index" {
                                        ZStack {
                                            Rectangle()
                                                .foregroundColor(.white)
                                                .cornerRadius(5)
                                                .shadow(radius: 5)
                                            NDIView(survey: survey)
                                        }
                                    }
                                    else {
                                        Text("Survey not found")
                                    }
                                    NavigationLink {
                                        PDFViewer()
                                    } label: {
                                        Text("Get there")
                                    }
                                    

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
        }.onAppear {
            model.selectedValue.removeAll()
            model.appendArray(survey.questions.count)
            model.finishedSurvey = false
        }
    }
    
}


