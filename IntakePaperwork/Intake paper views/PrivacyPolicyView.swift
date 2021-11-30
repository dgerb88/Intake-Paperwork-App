//
//  PrivacyPolicyView.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 10/28/21.
//

import SwiftUI

struct PrivacyPolicyView: View {
    
    @EnvironmentObject var model: SurveyModel
    @State var signature = ""
    @State var button = [false, false]
    
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(5)
                .shadow(radius: 5)
            VStack(alignment: .leading) {
                
                Text("Notice of Privacy Practices")
                    .bold()
                    .font(.largeTitle)
                    .padding(.bottom, 30)
                Text("Acknowledgement:")
                    .bold()
                    .font(.title2)
                    .padding(.bottom, 10)
                HStack(alignment: .top) {
                    Button {
                        if button[0] == false {
                            button[0] = true
                        }
                        else {
                            button[0] = false
                        }
                    } label: {
                        if button[0] == false {
                            Image(systemName: "square")
                                .padding(.trailing, 3)
                                .foregroundColor(.black)
                        }
                        else {
                            Image(systemName: "checkmark.square")
                                .padding(.trailing, 3)
                                .foregroundColor(.black)
                        }
                    }

                    Text("I have received, read, and fully understand the Notice of Privacy Practices for \(model.clinicName). I understand that \(model.clinicName) may use or disclose my personal health information for the purpose of carrying out treatment, obtaining payment, evaluating the quality of service provided, and any administrative operations related to treatment or payment. I understand that I have the right to request restrictions, in writing, regarding how my personal health information is used and disclosed for treatment, payment, and administrative operations. I also understand that \(model.clinicName) will consider requests for restrictions on a case by case basis, but is not required to oblige to such requests.")
                }.padding(.bottom)
                Text("Consent:")
                    .bold()
                    .font(.title2)
                    .padding(.bottom, 10)
                HStack(alignment: .top) {
                    Button {
                        if button[1] == false {
                            button[1] = true
                        }
                        else {
                            button[1] = false
                        }
                    } label: {
                        if button[1] == false {
                            Image(systemName: "square")
                                .padding(.trailing, 3)
                                .foregroundColor(.black)
                        }
                        else {
                            Image(systemName: "checkmark.square")
                                .padding(.trailing, 3)
                                .foregroundColor(.black)
                        }
                    }

                    Text("I hereby give my consent for \(model.clinicName) to use and disclose protected health information (PHI) about me to carry out treatment, payment, and health care operations. I understand that I retain the right to revoke this consent by notifying the practice in writing at any time, at which point \(model.clinicName) has 30 days to respond to my request.")
                }.padding(.bottom)
                if signature == "" {
                    Text("Patient/Legal Guardian Electronic Signature:")
                        .bold()
                        .font(.title2)
                        .padding(.top, 5)
                        .foregroundColor(.red)
                }
                else {
                    Text("Patient/Legal Guardian Electronic Signature:")
                        .bold()
                        .font(.title2)
                        .padding(.top, 5)
                }
                HStack {
                        TextField("Sign Here", text: $signature)
                            .frame(width: 300)
                            .padding(.leading, 20)
                            .accentColor(.black)
                            .textFieldStyle(.roundedBorder)
                        Text("Date: ")
                        .padding(.leading)
                        Text(Date().addingTimeInterval(600), style: .date)
                                .padding(.leading)
                }
            }.padding()
        }.onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
}

struct PrivacyPolicyView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyPolicyView()
    }
}
