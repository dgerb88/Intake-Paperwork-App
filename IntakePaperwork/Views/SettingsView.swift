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
                        Toggle("Dry Needling", isOn: self.$model.showDryNeedling)
                            .padding(.horizontal)
                        Toggle("Medical History", isOn: self.$model.showMedicalHistory)
                            .padding(.horizontal)
                        Toggle("Privacy Policy", isOn: self.$model.showPrivacyPolicy)
                            .padding(.horizontal)
                        Toggle("Insurance Intake", isOn: self.$model.showInsuranceIntake)
                            .padding(.horizontal)
                        Toggle("Information and Policies", isOn: self.$model.showInfoAndPolicies)
                            .padding(.horizontal)
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
