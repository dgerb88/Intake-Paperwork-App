//
//  SettingsView.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 10/30/21.
//

import SwiftUI

struct SelectionView: View {
    
    @EnvironmentObject var model: SurveyModel
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(5)
                .shadow(radius: 5)
            ScrollView {
                VStack(alignment: .center) {
                    VStack {
                        Text("Selections")
                            .bold()
                            .font(.largeTitle)
                            .padding(.bottom, 30)
                        Divider()
                        Toggle("Intake forms included", isOn: $model.eval)
                        Divider()
                            .padding(.bottom,30)
                        
                        
                    }
                    if model.eval == true {
                        VStack(alignment: .leading) {
                            Text("Which intake forms would you like to include?")
                                .bold()
                                .font(.title)
                                .padding(.bottom,30)
                            Divider()
                            Toggle("Information and policies", isOn: $model.includeInformationAndPolicies)
                            Divider()
                            Toggle("Insurance intake", isOn: $model.includeInsuranceIntake)
                            Divider()
                            
                        }
                        VStack {
                            Toggle("Medical History", isOn: $model.includeMedicalHistory)
                            Divider()
                            Toggle("Dry Needling consent", isOn: $model.includeDryNeedlingConsent)
                            Divider()
                            Toggle("Privacy Policy", isOn: $model.includePrivacyPolicy)
                            Divider()
                        }
                    }
                    
                }.padding()
            }
        }
        
    }
}

