//
//  NewSelectionView.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 11/12/21.
//

import SwiftUI

struct NewSelectionView: View {
    
    @EnvironmentObject var model: SurveyModel
    @State var LefsSelected = false
    @State var NdiSelected = false
    @State var QuickDashSelected = false
    @State var BackIndexSelected = false
    @State var isEnglish = true
    @State var isSpanish = false
    var language:String {
        if isEnglish == true {
            return "English"
        }
        else {
            return "Spanish"
        }
    }
    
    @State var nameSelected = "LEFS"
    
    
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .foregroundColor(Color.init(.sRGB, red: 0.92941, green: 0.92941, blue: 0.92941, opacity: 1))
                .cornerRadius(5)
                .shadow(radius: 5)
                .ignoresSafeArea(.all, edges: .bottom)
            ScrollView {
                VStack(spacing: 30) {
                    //MARK: Language
                    ZStack {
                        Rectangle()
                            .foregroundColor(.white)
                            .cornerRadius(5)
                        VStack {
                            Text("Language")
                                .bold()
                                .font(.largeTitle)
                                .padding(.bottom, 20)
                            HStack(spacing: 0) {
                                Group {
                                Button {
                                    if isEnglish == false {
                                        withAnimation {
                                            isEnglish = true
                                            isSpanish = false
                                            for i in 0..<model.surveysTF.count {
                                                model.surveysTF[i] = false
                                            }
                                            model.surveysTF[0] = true
                                            nameSelected = "LEFS"
                                        }
                                    }
                                } label: {
                                    ZStack {
                                        if isEnglish == true {
                                            Rectangle()
                                                .foregroundColor(.white)
                                                .frame(height: 48)
                                                .cornerRadius(5)
                                                .shadow(color: .black, radius: 1)
                                            Text("English")
                                                .foregroundColor(.black)
                                        }
                                        else {
                                            Rectangle()
                                                .foregroundColor(Color.init(.sRGB, red: 0.50196, green: 0.50196, blue: 0.50196, opacity: 0.2))
                                                .frame(height: 48)
                                                .cornerRadius(5)
                                                .shadow(color: .black, radius: 1)
                                            Text("English")
                                                .foregroundColor(.black)
                                        }
                                        
                                        
                                    }
                                    
                                }
                                Button {
                                    if isSpanish == false {
                                        withAnimation {
                                            isSpanish = true
                                            isEnglish = false
                                            for i in 0..<model.surveysTF.count {
                                                model.surveysTF[i] = false
                                            }
                                            model.surveysTF[1] = true
                                            nameSelected = "LEFS"
                                        }
                                    }
                                } label: {
                                    ZStack {
                                        if isSpanish == true {
                                            Rectangle()
                                                .foregroundColor(.white)
                                                .frame(height: 48)
                                                .cornerRadius(5)
                                                .shadow(color: .black, radius: 1)
                                            Text("Spanish")
                                                .foregroundColor(.black)
                                        }
                                        else {
                                            Rectangle()
                                                .foregroundColor(Color.init(.sRGB, red: 0.50196, green: 0.50196, blue: 0.50196, opacity: 0.2))
                                                .frame(height: 48)
                                                .cornerRadius(5)
                                                .shadow(color: .black, radius: 1)
                                            Text("Spanish")
                                                .foregroundColor(.black)
                                        }
                                        
                                        
                                    }
                                    
                                }
                                }
                                
                                
                            }.padding(.bottom, 20)
                        }.padding(.top, 20).padding(.horizontal, 20)
                    }
                    //MARK: Intake Paperwork
                    ZStack {
                        Rectangle()
                            .foregroundColor(.white)
                            .cornerRadius(5)
                        VStack {
                            Text("Intake forms")
                                .bold()
                                .font(.largeTitle)
                                .padding(.bottom, 20)
                            Toggle("Include intake forms", isOn: $model.eval)
                                .font(Font.title2)
                                .padding(.horizontal, 20)
                            Divider().padding(.bottom, 20)
                                if model.eval == true {
                                    Group {
                                        
                                        if model.showMedicalHistory {
                                            Button {
                                                if model.includeMedicalHistory == true {
                                                    model.includeMedicalHistory = false
                                                }
                                                else {
                                                    model.includeMedicalHistory = true
                                                }
                                            } label: {
                                                if model.includeMedicalHistory == true {
                                                    HStack {
                                                        Image(systemName: "checkmark.square")
                                                            .font(Font.title2.weight(.semibold))
                                                            .foregroundColor(.black)
                                                            .padding(.trailing, 5)
                                                        Text("Medical History")
                                                            .foregroundColor(.black)
                                                            .font(Font.title2.weight(.semibold))
                                                        Spacer()
                                                    }.padding(.horizontal, 20)
                                                }
                                                else {
                                                    HStack {
                                                        Image(systemName: "square")
                                                            .foregroundColor(.black)
                                                            .padding(.trailing, 5)
                                                        Text("Medical History")
                                                            .foregroundColor(.black)
                                                            .font(.title2)
                                                        Spacer()
                                                    }.padding(.horizontal, 20)
                                                }
                                            }
                                            Divider()
                                        }
                                        if model.showInsuranceIntake {
                                            Button {
                                                if model.includeInsuranceIntake == true {
                                                    model.includeInsuranceIntake = false
                                                }
                                                else {
                                                    model.includeInsuranceIntake = true
                                                }
                                            } label: {
                                                if model.includeInsuranceIntake == true {
                                                    HStack {
                                                        Image(systemName: "checkmark.square")
                                                            .font(Font.title2.weight(.semibold))
                                                            .foregroundColor(.black)
                                                            .padding(.trailing, 5)
                                                        Text("Insurance Intake")
                                                            .foregroundColor(.black)
                                                            .font(Font.title2.weight(.semibold))
                                                        Spacer()
                                                    }.padding(.horizontal, 20)
                                                }
                                                else {
                                                    HStack {
                                                        Image(systemName: "square")
                                                            .foregroundColor(.black)
                                                            .padding(.trailing, 5)
                                                        Text("Insurance Intake")
                                                            .foregroundColor(.black)
                                                            .font(.title2)
                                                        Spacer()
                                                    }.padding(.horizontal, 20)
                                                }
                                            }
                                            Divider()
                                        }
                                        
                                    }
                                    Group {
                                        
                                        if model.showInfoAndPolicies {
                                            Button {
                                                if model.includeInformationAndPolicies == true {
                                                    model.includeInformationAndPolicies = false
                                                }
                                                else {
                                                    model.includeInformationAndPolicies = true
                                                }
                                            } label: {
                                                if model.includeInformationAndPolicies == true {
                                                    HStack {
                                                        Image(systemName: "checkmark.square")
                                                            .font(Font.title2.weight(.semibold))
                                                            .foregroundColor(.black)
                                                            .padding(.trailing, 5)
                                                        Text("Information and Policies")
                                                            .foregroundColor(.black)
                                                            .font(Font.title2.weight(.semibold))
                                                        Spacer()
                                                    }.padding(.horizontal, 20)
                                                }
                                                else {
                                                    HStack {
                                                        Image(systemName: "square")
                                                            .foregroundColor(.black)
                                                            .padding(.trailing, 5)
                                                        Text("Information and Policies")
                                                            .foregroundColor(.black)
                                                            .font(.title2)
                                                        Spacer()
                                                    }.padding(.horizontal, 20)
                                                }
                                            }
                                            Divider()
                                        }
                                        if model.showPrivacyPolicy {
                                            Button {
                                                if model.includePrivacyPolicy == true {
                                                    model.includePrivacyPolicy = false
                                                }
                                                else {
                                                    model.includePrivacyPolicy = true
                                                }
                                            } label: {
                                                if model.includePrivacyPolicy == true {
                                                    HStack {
                                                        Image(systemName: "checkmark.square")
                                                            .font(Font.title2.weight(.semibold))
                                                            .foregroundColor(.black)
                                                            .padding(.trailing, 5)
                                                        Text("Privacy Policy")
                                                            .foregroundColor(.black)
                                                            .font(Font.title2.weight(.semibold))
                                                        Spacer()
                                                    }.padding(.horizontal, 20)
                                                }
                                                else {
                                                    HStack {
                                                        Image(systemName: "square")
                                                            .foregroundColor(.black)
                                                            .padding(.trailing, 5)
                                                        Text("Privacy Policy")
                                                            .foregroundColor(.black)
                                                            .font(.title2)
                                                        Spacer()
                                                    }.padding(.horizontal, 20)
                                                }
                                            }
                                            Divider()
                                        }
                                            if model.showDryNeedling {
                                                Button {
                                                    if model.includeDryNeedlingConsent == true {
                                                        model.includeDryNeedlingConsent = false
                                                    }
                                                    else {
                                                        model.includeDryNeedlingConsent = true
                                                    }
                                                } label: {
                                                    if model.includeDryNeedlingConsent == true {
                                                        HStack {
                                                            Image(systemName: "checkmark.square")
                                                                .font(Font.title2.weight(.semibold))
                                                                .foregroundColor(.black)
                                                                .padding(.trailing, 5)
                                                            Text("Dry Needling Consent")
                                                                .foregroundColor(.black)
                                                                .font(Font.title2.weight(.semibold))
                                                            Spacer()
                                                        }.padding(.horizontal, 20)
                                                    }
                                                    else {
                                                        HStack {
                                                            Image(systemName: "square")
                                                                .foregroundColor(.black)
                                                                .padding(.trailing, 5)
                                                            Text("Dry Needling Consent")
                                                                .foregroundColor(.black)
                                                                .font(.title2)
                                                            Spacer()
                                                        }.padding(.horizontal, 20)
                                                    }
                                                }
                                                Divider()
                                            }
                                        
                                    }
                                }
                            
                        }.padding(20)
                    }
                    //MARK: Survey
                    ZStack {
                        Rectangle()
                            .foregroundColor(.white)
                            .cornerRadius(5)
                        VStack {
                            Group {
                                Text("Surveys")
                                    .bold()
                                    .font(.largeTitle)
                                    .padding(.bottom, 20)
                                Toggle("Include survey", isOn: $model.includeSurvey)
                                    .font(Font.title2)
                                    .padding(.horizontal, 20)
                                Divider().padding(.bottom, 30)
                            }
                            if model.includeSurvey {
                                ForEach(0..<model.surveys.count, id: \.self) { index in
                                    VStack {
                                        if model.surveys[index].language == language {
                                            Button {
                                                model.setTFSurvey(index: index)
                                                nameSelected = model.surveys[index].name
                                            } label: {
                                                HStack {
                                                    if model.surveysTF[index] {
                                                        Image(systemName: "checkmark")
                                                            .font(Font.title2.weight(.semibold))
                                                            .foregroundColor(.black)
                                                        Text(model.surveys[index].name)
                                                            .font(Font.title2.weight(.semibold))
                                                            .foregroundColor(.black)
                                                    }
                                                    else {
                                                        Text(model.surveys[index].name)
                                                            .foregroundColor(.black)
                                                            .font(.title2)
                                                    }
                                                    Spacer()
                                                }.padding(.horizontal, 20).padding(.top, 15)
                                            }
                                            Divider()
                                        }
                                    }
                                }
                            }
                            //MARK: Go button
                            ForEach(model.surveys) { survey in
                                VStack {
                                    if survey.name == nameSelected && survey.language == language {
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
                                                    else if survey.name == "Berg Balance Scale" {
                                                        BergBalance(survey: survey)
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
                                                    else if survey.name == "Berg Balance Scale" {
                                                        BergBalance(survey: survey)
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
                                            }.padding(.top)
                                        }
                                        .disabled(model.includeSurvey == false && model.eval == false ? true:false)
                                        .navigationBarBackButtonHidden(true)
                                    }
                                }
                            }
                        }.padding(20)
                    }
                    Spacer()
                }.padding()
            }
        }
        .frame(width: UIScreen.main.bounds.width)
        .onAppear {
            model.setSettings()
            model.checkSubscription()
            isSpanish = false
            isEnglish = true
            LefsSelected = true
            NdiSelected = false
            BackIndexSelected = false
            QuickDashSelected = false
            for i in 0..<model.surveysTF.count {
                model.surveysTF[i] = false
            }
            model.surveysTF[0] = true
        }
    }
}





