//
//  SettingsView.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 11/16/21.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var model: SurveyModel
    
    var body: some View {
        ZStack {
            BackgroundView()
                .frame(width: UIScreen.main.bounds.width)
            ZStack {
                VStack(alignment: .leading) {
                    List {
                        Section(header: Text("Intake forms shown").font(.title2).foregroundColor(.black)) {
                            Toggle("Dry Needling", isOn: self.$model.showDryNeedling)
                            Toggle("Medical History", isOn: self.$model.showMedicalHistory)
                            Toggle("Privacy Policy", isOn: self.$model.showPrivacyPolicy)
                            Toggle("Insurance Intake", isOn: self.$model.showInsuranceIntake)
                            Toggle("Information and Policies", isOn: self.$model.showInfoAndPolicies)
                        }
                        Section {
                            HStack {
                                Text("Clinic name: ")
                                    .padding(.trailing)
                                Spacer()
                                TextField("Name", text: $model.clinicName)
                                    .accentColor(.black)
                                    .frame(width: 450)
                                    .multilineTextAlignment(.trailing)
                            }
                            HStack {
                                Text("Physical Therapist name: ")
                                    .padding(.trailing)
                                Spacer()
                                TextField("Therapist full name", text: $model.ptName)
                                    .accentColor(.black)
                                    .frame(width: 450)
                                    .multilineTextAlignment(.trailing)
                            }
                            HStack {
                                Text("Physical Therapist credentials: ")
                                    .padding(.trailing)
                                Spacer()
                                TextField("ie. DPT, ATC, etc.", text: $model.ptCredential)
                                    .accentColor(.black)
                                    .frame(width: 450)
                                    .multilineTextAlignment(.trailing)
                            }
                            HStack {
                                Text("Clinic phone number: ")
                                    .padding(.trailing)
                                Spacer()
                                TextField("Phone number", text: $model.phoneNumber)
                                    .accentColor(.black)
                                    .frame(width: 450)
                                    .multilineTextAlignment(.trailing)
                            }
                            HStack {
                                Text("Cancel fee: ")
                                    .padding(.trailing)
                                Spacer()
                                TextField("Cancel fee amount(numerical value only)", text: $model.cancelFee)
                                    .accentColor(.black)
                                    .frame(width: 450)
                                    .multilineTextAlignment(.trailing)
                            }
                            HStack {
                                Text("No show fee: ")
                                    .padding(.trailing)
                                Spacer()
                                TextField("No show fee amount(numerical value only)", text: $model.noShowFee)
                                    .accentColor(.black)
                                    .frame(width: 450)
                                    .multilineTextAlignment(.trailing)
                            }
                            
                        } header: {
                            Text("Clinic Specific Details")
                                .font(.title2)
                                .foregroundColor(.black)
                        }

                    }
                }
            }.padding(.top)
        }.navigationBarTitleDisplayMode( .inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Settings")
                        .bold()
                        .foregroundColor(.white)
                        .font(.largeTitle)
                }
            }

    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
