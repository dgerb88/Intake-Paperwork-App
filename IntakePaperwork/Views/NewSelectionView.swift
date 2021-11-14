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
    
    var nameSelected: String {
        if QuickDashSelected == true {
            return "QuickDash"
        }
        else if NdiSelected == true {
            return "Neck Disability Index"
        }
        else if BackIndexSelected == true {
            return "Back Index"
        }
        else if LefsSelected == true {
            return "LEFS"
        }
        else {
            return ""
        }
    }

    
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(5)
                .shadow(radius: 5)
            ScrollView {
                VStack {
                    //MARK: Language
                    VStack {
                        Text("Language")
                            .bold()
                            .font(.largeTitle)
                            .padding(.bottom, 20)
                        HStack(spacing: 0) {
                            Button {
                                if isEnglish == false {
                                    isEnglish = true
                                    isSpanish = false
                                }
                            } label: {
                                ZStack {
                                    if isEnglish == true {
                                        Rectangle()
                                            .foregroundColor(Color.init(.sRGB, red: 0.50196, green: 0.50196, blue: 0.50196, opacity: 0.2))
                                            .frame(height: 48)
                                            .cornerRadius(5)
                                            .shadow(radius: 1)
                                        Text("English")
                                            .foregroundColor(.black)
                                    }
                                    else {
                                        Rectangle()
                                            .foregroundColor(.white)
                                            .frame(height: 48)
                                            .cornerRadius(5)
                                            .shadow(color: .gray, radius: 1)
                                        Text("English")
                                            .foregroundColor(.black)
                                    }
                                
                                
                            }

                        }
                            Button {
                                if isSpanish == false {
                                    isSpanish = true
                                    isEnglish = false
                                }
                            } label: {
                                ZStack {
                                    if isSpanish == true {
                                        Rectangle()
                                            .foregroundColor(Color.init(.sRGB, red: 0.50196, green: 0.50196, blue: 0.50196, opacity: 0.2))
                                            .frame(height: 48)
                                            .cornerRadius(5)
                                            .shadow(radius: 1)
                                        Text("Spanish")
                                            .foregroundColor(.black)
                                    }
                                    else {
                                        Rectangle()
                                            .foregroundColor(.white)
                                            .frame(height: 48)
                                            .cornerRadius(5)
                                            .shadow(color: .gray, radius: 1)
                                        Text("Spanish")
                                            .foregroundColor(.black)
                                    }
                                
                                
                            }

                        }

                        
                    }.padding(.bottom, 20)
                    }.padding(.horizontal, 20)
                    //MARK: Intake Paperwork
                    VStack {
                        Toggle("Include intake forms", isOn: $model.eval)
                            .font(Font.title2)
                            .padding(.horizontal, 20)
                        Divider().padding(.bottom, 20)
                        VStack {
                            if model.eval == true {
                                VStack {
                                    Text("Intake forms selection")
                                        .bold()
                                        .font(.largeTitle)
                                        .fixedSize(horizontal: false, vertical: true)
                                        .padding(.bottom, 20)
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
                                                    .font(Font.title2.weight(.bold))
                                                    .foregroundColor(.black)
                                                    .padding(.trailing, 5)
                                                Text("Dry Needling Consent")
                                                    .bold()
                                                    .foregroundColor(.black)
                                                    .font(.title2)
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
                                                    .font(Font.title2.weight(.bold))
                                                    .foregroundColor(.black)
                                                    .padding(.trailing, 5)
                                                Text("Medical History")
                                                    .foregroundColor(.black)
                                                    .font(Font.title2.weight(.bold))
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
                                                    .font(Font.title2.weight(.bold))
                                                    .foregroundColor(.black)
                                                    .padding(.trailing, 5)
                                                Text("Privacy Policy")
                                                    .foregroundColor(.black)
                                                    .font(Font.title2.weight(.bold))
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
                                VStack {
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
                                                    .font(Font.title2.weight(.bold))
                                                    .foregroundColor(.black)
                                                    .padding(.trailing, 5)
                                                Text("Insurance Intake")
                                                    .foregroundColor(.black)
                                                    .font(Font.title2.weight(.bold))
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
                                                    .font(Font.title2.weight(.bold))
                                                    .foregroundColor(.black)
                                                    .padding(.trailing, 5)
                                                Text("Information and Policies")
                                                    .foregroundColor(.black)
                                                    .font(Font.title2.weight(.bold))
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
                            }
                        }

                    }.padding(.bottom, 20)
                    //MARK: Survey
                    VStack {
                        Text("Survey")
                            .bold()
                            .font(.largeTitle)
                            .padding(.bottom, 20)
                        Button {
                            if LefsSelected == false {
                                LefsSelected = true
                                BackIndexSelected = false
                                NdiSelected = false
                                QuickDashSelected = false
                            }
                        } label: {
                            if LefsSelected == true {
                                HStack {
                                    Image(systemName: "checkmark.square")
                                        .font(Font.title2.weight(.bold))
                                        .foregroundColor(.black)
                                        .padding(.trailing, 5)
                                    Text("LEFS")
                                        .bold()
                                        .foregroundColor(.black)
                                    .font(.title2)
                                    Spacer()
                                }.padding(.horizontal, 20)
                            }
                            else {
                                HStack {
                                    Image(systemName: "square")
                                        .foregroundColor(.black)
                                        .padding(.trailing, 5)
                                    Text("LEFS")
                                        .foregroundColor(.black)
                                        .font(.title2)
                                    Spacer()
                                }.padding(.horizontal, 20)
                            }
                        }
                        Divider()
                        Button {
                            if NdiSelected == false {
                                NdiSelected = true
                                BackIndexSelected = false
                                LefsSelected = false
                                QuickDashSelected = false
                            }
                            
                        } label: {
                            if NdiSelected == true {
                                HStack {
                                    Image(systemName: "checkmark.square")
                                        .font(Font.title2.weight(.bold))
                                        .foregroundColor(.black)
                                        .padding(.trailing, 5)
                                    Text("NDI")
                                        .bold()
                                        .foregroundColor(.black)
                                    .font(.title2)
                                    Spacer()
                                }.padding(.horizontal, 20)
                            }
                            else {
                                HStack {
                                    Image(systemName: "square")
                                        .foregroundColor(.black)
                                        .padding(.trailing, 5)
                                    Text("NDI")
                                        .foregroundColor(.black)
                                        .font(.title2)
                                    Spacer()
                                }.padding(.horizontal, 20)
                            }
                        }
                        Divider()
                        Button {
                            if BackIndexSelected == false {
                                BackIndexSelected = true
                                LefsSelected = false
                                NdiSelected = false
                                QuickDashSelected = false
                            }
                            
                        } label: {
                            if BackIndexSelected == true {
                                HStack {
                                    Image(systemName: "checkmark.square")
                                        .font(Font.title2.weight(.bold))
                                        .foregroundColor(.black)
                                        .padding(.trailing, 5)
                                    Text("Back Index")
                                        .bold()
                                        .foregroundColor(.black)
                                        .font(.title2)
                                    Spacer()
                                }.padding(.horizontal, 20)
                            }
                            else {
                                HStack {
                                    Image(systemName: "square")
                                        .foregroundColor(.black)
                                        .padding(.trailing, 5)
                                    Text("Back Index")
                                        .foregroundColor(.black)
                                        .font(.title2)
                                    Spacer()
                                }.padding(.horizontal, 20)
                            }
                        }
                        Divider()
                        Button {
                            if QuickDashSelected == false {
                                QuickDashSelected = true
                                BackIndexSelected = false
                                NdiSelected = false
                                LefsSelected = false
                            }
            
                        } label: {
                            if QuickDashSelected == true {
                                HStack {
                                    Image(systemName: "checkmark.square")
                                        .font(Font.title2.weight(.bold))
                                        .foregroundColor(.black)
                                        .padding(.trailing, 5)
                                    Text("Quick Dash")
                                        .bold()
                                        .foregroundColor(.black)
                                        .font(.title2)
                                    Spacer()
                                }.padding(.horizontal, 20)
                            }
                            else {
                                HStack {
                                    Image(systemName: "square")
                                        .foregroundColor(.black)
                                        .padding(.trailing, 5)
                                    Text("Quick Dash")
                                        .foregroundColor(.black)
                                        .font(.title2)
                                    Spacer()
                                }.padding(.horizontal, 20)
                            }
                        }
                        Divider().padding(.bottom, 20)

                    }
                    //MARK: Go button
                    VStack {
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
                            ForEach(model.surveys) { survey in
                                if survey.name == nameSelected && survey.language == language {
                                    NavigationLink {
                                        SurveyView(survey: survey)
                                            .onAppear {
                                                model.appendArray(survey.questions.count)
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
                                }
                                
                            }
                        }
                    }
                    Spacer()
                }.padding()
            }
        }.onAppear {
            model.eval = true
            model.includePrivacyPolicy = true
            model.includeMedicalHistory = true
            model.includeInsuranceIntake = true
            model.includeInformationAndPolicies = true
            model.includeDryNeedlingConsent = true
            isSpanish = false
            isEnglish = true
            LefsSelected = false
            NdiSelected = false
            BackIndexSelected = false
            QuickDashSelected = false
        }
        
    }
}


struct NewSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        NewSelectionView()
    }
}
