//
//  InsuranceIntakeView.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 10/28/21.
//

import SwiftUI

struct InsuranceIntakeView: View {
    
    @EnvironmentObject var model:SurveyModel
    
    @State var patientNameInsurance = ""
    @State var InsuranceNameInsurance = ["", ""]
    @State var memberIdInsurance = ["", ""]
    @State var groupNumberInsurance = ["", ""]
    @State var signatureInsurance = ""
    @State var buttonInsurance = [false, false, false, false, false, false, false]
    var survey: Survey
    @State var keyboardChange = false

    
    var insuranceView: some View {
        ZStack {
            VStack {
                VStack(alignment: .center) {
                    Text("Insurance Information")
                        .bold()
                        .font(.largeTitle)
                        .padding(.bottom, 30)
                }.padding()
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        HStack(alignment: .top, spacing: 20) {
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Name of Patient or Legal Guardian(if patient is a minor):")
                                    .fixedSize(horizontal: false, vertical: true)
                                TextField("Name", text: $patientNameInsurance)
                                    .accentColor(.black)
                                    .textFieldStyle(.roundedBorder)
                                    .padding(.bottom, 5)
                                Text("Name of Primary Insurance Carrier:")
                                TextField("Insurance Name", text: $InsuranceNameInsurance[0])
                                    .accentColor(.black)
                                    .textFieldStyle(.roundedBorder)
                                    .padding(.bottom, 5)
                                Text("Member ID:")
                                TextField("ID number", text: $memberIdInsurance[0])
                                    .padding(.bottom, 5)
                                    .accentColor(.black)
                                    .textFieldStyle(.roundedBorder)
                                Text("Group Number:")
                                TextField("Number", text: $groupNumberInsurance[0])
                                    .padding(.bottom, 5)
                                    .accentColor(.black)
                                    .textFieldStyle(.roundedBorder)
                            }
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Name of Secondary Insurance Carrier (if applicable):")
                                TextField("Secondary Insurance Name", text: $InsuranceNameInsurance[1])
                                    .padding(.bottom, 5)
                                    .accentColor(.black)
                                    .textFieldStyle(.roundedBorder)
                                Text("Member ID:")
                                TextField("ID number", text: $memberIdInsurance[1])
                                    .padding(.bottom, 5)
                                    .accentColor(.black)
                                    .textFieldStyle(.roundedBorder)
                                Text("Group Number:")
                                TextField("Number", text: $groupNumberInsurance[1])
                                    .padding(.bottom, 5)
                                    .accentColor(.black)
                                    .textFieldStyle(.roundedBorder)
                            }
                        }
                    }
                    VStack(alignment: .leading) {
                        Text("Patient Financial Responsibility form:")
                            .bold()
                            .font(.title2)
                            .padding(.top, 20)
                        Text("Agreement: \(model.clinicName) would like to be as transparent as possible in regard to fees for services and responsibilities. Because we recognize the need for a clear understanding between patient and medical provider regarding financial arrangements for healthcare, the following information is provided to avoid any misunderstanding concerning protected health information and payment for professional services.")
                            .fixedSize(horizontal: false, vertical: true)

                        Text("Insurance Patient Financial Responsibility Form - Consents")
                            .bold()
                            .font(.title2)
                            .padding(.top, 10)
                        Text("Please check the box to indicate that you understand the following:")
                            .bold()
                            .padding(.vertical)
                            .font(.title3)
                        HStack(alignment: .top) {
                            Button {
                                if buttonInsurance[0] == false {
                                    buttonInsurance[0] = true
                                }
                                else {
                                    buttonInsurance[0] = false
                                }
                            } label: {
                                if buttonInsurance[0] == true {
                                    Image(systemName: "checkmark.square")
                                        .font(Font.title2)
                                        .foregroundColor(.black)
                                }
                                else {
                                    Image(systemName: "square")
                                        .font(Font.title2)
                                        .foregroundColor(.black)
                                }
                            }
                            Text("As a courtesy, we bill your insurance carrier. However, it must be understood that the contract is between you and your insurance carrier and you are fully responsible for any amount that they do not pay.")
                            .fixedSize(horizontal: false, vertical: true)
                        }.padding(.bottom, 10)
                        HStack(alignment: .top) {
                            Button {
                                if buttonInsurance[1] == false {
                                    buttonInsurance[1] = true
                                }
                                else {
                                    buttonInsurance[1] = false
                                }
                            } label: {
                                if buttonInsurance[1] == true {
                                    Image(systemName: "checkmark.square")
                                        .font(Font.title2)
                                        .foregroundColor(.black)
                                }
                                else {
                                    Image(systemName: "square")
                                        .font(Font.title2)
                                        .foregroundColor(.black)
                                }
                            }
                            Text("Our office does not guarantee that your insurance will pay. Some insurance companies do not cover certain treatments. We will assist you in making every attempt to receive verification of your policy. If your claim is denied for any reason, you are responsible for the full amount of your bill.")
                                .fixedSize(horizontal: false, vertical: true)
                        }.padding(.bottom, 10)
                        HStack(alignment: .top) {
                            Button {
                                if buttonInsurance[2] == false {
                                    buttonInsurance[2] = true
                                }
                                else {
                                    buttonInsurance[2] = false
                                }
                            } label: {
                                if buttonInsurance[2] == true {
                                    Image(systemName: "checkmark.square")
                                        .font(Font.title2)
                                        .foregroundColor(.black)
                                }
                                else {
                                    Image(systemName: "square")
                                        .font(Font.title2)
                                        .foregroundColor(.black)
                                }
                            }
                            Text("Our office will not enter into a dispute with your insurance company over any unpaid claim.")
                        }.padding(.bottom, 10)
                        HStack(alignment: .top) {
                            Button {
                                if buttonInsurance[3] == false {
                                    buttonInsurance[3] = true
                                }
                                else {
                                    buttonInsurance[3] = false
                                }
                            } label: {
                                if buttonInsurance[3] == true {
                                    Image(systemName: "checkmark.square")
                                        .font(Font.title2)
                                        .foregroundColor(.black)
                                }
                                else {
                                    Image(systemName: "square")
                                        .font(Font.title2)
                                        .foregroundColor(.black)
                                }
                            }
                            Text("PAYMENT: Even though insurance will be billed, you are responsible for any balance after insurance processes your claim. All charges for treatment become due and payable sixty (60) days after the date of service. These periods allow sufficient time to process insurance and make payment in full of any remaining balance.")
                                .fixedSize(horizontal: false, vertical: true)
                        }.padding(.bottom, 10)
                    }
                    VStack(alignment: .leading) {
                        Text("Insurance Payment Agreement:")
                            .bold()
                            .font(.title2)
                            .padding(.top, 10)
                        Text("I understand that I am financially responsible for my health insurance deductible, coinsurance, or non-covered service. Copayments are due at time of service. In the event that my health plan determines a service to be “not payable”, I will be responsible for the complete charge and agree to pay the costs of all services provided. In the event that my insurer does not pay all of the medical charges incurred, I hereby authorize \(model.clinicName) to automatically charge the credit or debit card on my account for the remaining balance due.")
                            .fixedSize(horizontal: false, vertical: true)

                        Text("Insurance Authorization for Assigment of Benefits:")
                            .bold()
                            .font(.title2)
                            .padding(.top, 10)
                        Text("I hereby authorize and direct payment of my medical benefits to \(model.clinicName) on my behalf for any services furnished to me by the providers.")
                            .fixedSize(horizontal: false, vertical: true)
                        Text("Authorization to Release Records:")
                            .bold()
                            .font(.title2)
                            .padding(.top, 10)
                        Text("I hereby authorize \(model.clinicName) to release to my insurer, governmental agencies, or any other entity financially responsible for my medical care, all information, including diagnosis and the records of any treatment or examination rendered to me needed to substantiate payment for such medical services as well as information required for pre-certification, authorization or referral to other medical provider.")
                            .fixedSize(horizontal: false, vertical: true)
                        Text("I have read and understand these policies and my responsibility concerning the payment of these services")
                            .bold()
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.title3)
                            .padding(.vertical, 10)
                        if signatureInsurance == "" {
                            Text("Signature of patient or legal guardian:")
                                .foregroundColor(.red)
                        }
                        else {
                            Text("Signature of patient or legal guardian:")
                                .foregroundColor(.black)
                        }
                        HStack {
                            TextField("Signature", text: $signatureInsurance)
                                .padding(.bottom, 5)
                                .accentColor(.black)
                                .textFieldStyle(.roundedBorder)
                                .frame(width: 300)
                                .onTapGesture {
                                    keyboardChange = true
                                }
                            Text("Date: ")
                                .padding(.leading)
                            Text(Date().addingTimeInterval(600), style: .date)
                                    .padding(.leading)
                            
                        }.padding(.bottom)
                    }
                }.padding(.bottom).padding(.horizontal)
            }.padding(.bottom, 30)
        }.frame(width: UIScreen.main.bounds.width)
    }

    
    var body: some View {
        ZStack {
            BackgroundView()
            ScrollView {
                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                        .cornerRadius(5)
                        .shadow(radius: 5)
                    VStack {
                        insuranceView
                            .onDisappear {
                                let image = insuranceView.snapshot()
                                model.PDFimage.append(image)
                                model.PDFfile = model.createPDF(image: image)
                                model.PDFfileArray.append(model.PDFfile!)
                            }
                        NavigationLink {
                            if model.showInfoAndPolicies == true && model.includeInformationAndPolicies == true {
                                InformationAndPoliciesView(survey: survey)
                            }
                            else if model.showPrivacyPolicy == true && model.includePrivacyPolicy == true {
                                PrivacyPolicyView(survey: survey)
                            }
                            else if model.showDryNeedling == true && model.includeDryNeedlingConsent == true {
                                DryNeedlingConsentView(survey: survey)
                            }
                            else {
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
                        } label: {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.green)
                                    .frame(height: 48)
                                    .cornerRadius(10)
                                    .shadow(radius: 1)
                                Text("Next")
                                    .foregroundColor(.white)
                                    .font(.title)
                                    .bold()
                            }.padding().padding(.bottom)
                        }.navigationBarBackButtonHidden(true)
                    }
                }
            }
        }
            .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                keyboardChange = false
            }
            .padding(.bottom, keyboardChange ? UIScreen.main.bounds.height*3/10 : 0)
            .animation(.easeOut(duration: 0.3))
    }
}


