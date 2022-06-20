//
//  GoButtonView.swift
//  PaperlessWork
//
//  Created by Dax Gerber on 6/13/22.
//

import SwiftUI

struct GoButtonView: View {
    
    @EnvironmentObject var model: SurveyModel
    var nameSelected: String
    var language: String
    var survey: Survey
    
    var body: some View {
                    NavigationLink(tag: 0,
                                   selection: $model.viewSelectionInt) {
                        if model.eval == true {
                            
                            if model.showMedicalHistory == true && model.includeMedicalHistory == true {
                                if language == "English" {
                                    MedicalHistoryView(survey: survey)
                                        .onAppear {
                                            model.PDFfileArray.removeAll()
                                            model.PDFimage.removeAll()
                                        }
                                }
                                else {
                                    SpanishMedView(survey: survey)
                                        .onAppear {
                                            model.PDFfileArray.removeAll()
                                            model.PDFimage.removeAll()
                                        }
                                }
                            }
                            else if model.showInsuranceIntake == true && model.includeInsuranceIntake == true {
                                if language == "English" {
                                    InsuranceIntakeView(survey: survey)
                                        .onAppear {
                                            model.PDFfileArray.removeAll()
                                            model.PDFimage.removeAll()
                                        }
                                }
                                else {
                                    SpanInsuranceView(survey: survey)
                                        .onAppear {
                                            model.PDFfileArray.removeAll()
                                            model.PDFimage.removeAll()
                                        }
                                }
                            }
                            else if model.showInfoAndPolicies == true && model.includeInformationAndPolicies == true {
                                if language == "English" {
                                    InformationAndPoliciesView(survey: survey)
                                        .onAppear {
                                            model.PDFfileArray.removeAll()
                                            model.PDFimage.removeAll()
                                        }
                                }
                                else {
                                    SpanInfoView(survey: survey)
                                        .onAppear {
                                            model.PDFfileArray.removeAll()
                                            model.PDFimage.removeAll()
                                        }
                                }
                            }
                            else if model.showPrivacyPolicy == true && model.includePrivacyPolicy == true {
                                if language == "English" {
                                    PrivacyPolicyView(survey: survey)
                                        .onAppear {
                                            model.PDFfileArray.removeAll()
                                            model.PDFimage.removeAll()
                                        }
                                }
                                else {
                                    SpanPrivacyPolicyView(survey: survey)
                                        .onAppear {
                                            model.PDFfileArray.removeAll()
                                            model.PDFimage.removeAll()
                                        }
                                }
                            }
                            else if model.showDryNeedling == true && model.includeDryNeedlingConsent == true {
                                if language == "English" {
                                    DryNeedlingConsentView(survey: survey)
                                        .onAppear {
                                            model.PDFfileArray.removeAll()
                                            model.PDFimage.removeAll()
                                        }
                                }
                                else {
                                    SpanDryNeedleView(survey: survey)
                                        .onAppear {
                                            model.PDFfileArray.removeAll()
                                            model.PDFimage.removeAll()
                                        }
                                }
                            }
                            else {
                                if survey.name == "LEFS" {
                                    LefsView(survey: survey)
                                        .onAppear {
                                            model.PDFfileArray.removeAll()
                                            model.PDFimage.removeAll()
                                        }
                                }
                                else if survey.name == "Back Index" {
                                    BackIndexView(survey: survey)
                                        .onAppear {
                                            model.PDFfileArray.removeAll()
                                            model.PDFimage.removeAll()
                                        }
                                }
                                else if survey.name == "QuickDash" && survey.language == "English" {
                                    QuickDashEngView(survey: survey)
                                        .onAppear {
                                            model.PDFfileArray.removeAll()
                                            model.PDFimage.removeAll()
                                        }
                                }
                                else if survey.name == "QuickDash" && survey.language == "Spanish" {
                                    QuickDashSpanView(survey: survey)
                                        .onAppear {
                                            model.PDFfileArray.removeAll()
                                            model.PDFimage.removeAll()
                                        }
                                }
                                else if survey.name == "Neck Disability Index" {
                                    NDIView(survey: survey)
                                        .onAppear {
                                            model.PDFfileArray.removeAll()
                                            model.PDFimage.removeAll()
                                        }
                                }
                                else {
                                    Text("Survey not found")
                                }
                            }
                        }
                        else {
                            if model.includeSurvey {
                                if survey.name == "LEFS" {
                                    LefsView(survey: survey)
                                        .onAppear {
                                            model.PDFfileArray.removeAll()
                                            model.PDFimage.removeAll()
                                        }
                                }
                                else if survey.name == "Back Index" {
                                    BackIndexView(survey: survey)
                                        .onAppear {
                                            model.PDFfileArray.removeAll()
                                            model.PDFimage.removeAll()
                                        }
                                }
                                else if survey.name == "QuickDash" && survey.language == "English" {
                                    QuickDashEngView(survey: survey)
                                        .onAppear {
                                            model.PDFfileArray.removeAll()
                                            model.PDFimage.removeAll()
                                        }
                                }
                                else if survey.name == "QuickDash" && survey.language == "Spanish" {
                                    QuickDashSpanView(survey: survey)
                                        .onAppear {
                                            model.PDFfileArray.removeAll()
                                            model.PDFimage.removeAll()
                                        }
                                }
                                else if survey.name == "Neck Disability Index" {
                                    NDIView(survey: survey)
                                        .onAppear {
                                            model.PDFfileArray.removeAll()
                                            model.PDFimage.removeAll()
                                        }
                                }
                                else {
                                    Text("Survey not found")
                                }
                            }
                        }
                    } label: {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.green)
                                .frame(height: 48)
                                .cornerRadius(10)
                                .shadow(radius: 1)
                            Text("Go")
                                .bold()
                                .font(.title)
                                .foregroundColor(.white)
                        }
                    }
                    .disabled(model.includeSurvey == false && model.eval == false ? true:false)
                    .navigationBarBackButtonHidden(true)
                
            
        

    }
}


