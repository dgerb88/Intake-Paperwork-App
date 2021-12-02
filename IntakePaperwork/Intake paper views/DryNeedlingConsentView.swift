//
//  DryNeedlingConsentView.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 10/28/21.
//

import SwiftUI

struct DryNeedlingConsentView: View {
    
    @EnvironmentObject var model:SurveyModel
    
    @State var buttonNeedle = [false, false, false, false, false, false, false, false, false]
    @State var signatureNeedle = ""
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(5)
                .shadow(radius: 5)
            VStack(alignment: .leading) {
                Text("Dry Needling Consent Form")
                    .bold()
                    .font(.largeTitle)
                    .padding(.bottom, 30)
                VStack(alignment: .leading) {
                    
                    Text("Patient consent for function dry needling (FDN):")
                        .bold()
                        .font(.title2)
                        .padding(.bottom, 3)
                    Text("I understand that no guarantee or assurance has been made as to the results of this procedure and that it may not cure my condition. My therapist has also discussed with me the probability of success of this procedure, as well as the possibility of serious side effects. Multiple treatment sessions may be required/needed, thus this consent will cover this treatment as well as consecutive treatments by this facility. I have read and fully understand this consent form and understand that I should not sign this form until all items, including my questions, have been explained or answered to my satisfaction. With my signature, I hereby consent to the performance of this procedure. I also consent to any measures necessary to correct complications that may result.")
                        .padding(.bottom)
                    Text("Authorization:")
                        .bold()
                        .font(.title2)
                    HStack(alignment: .top) {
                        Button {
                            if buttonNeedle[0] == false {
                                buttonNeedle[0] = true
                                buttonNeedle[1] = false
                            }
                            else {
                                buttonNeedle[0] = false
                            }
                        } label: {
                            if buttonNeedle[0] == false {
                                Image(systemName: "square")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.black)
                            }
                            else {
                                Image(systemName: "checkmark.square")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.black)
                            }
                        }.padding(.leading, 5)
                        Text("I hereby authorize \(model.ptName), \(model.ptCredential) to perform Functional Dry Needling during my treatment.")
                            .padding(.bottom)
                    }
                    Text("Patient refusal of service:")
                        .bold()
                        .font(.title2)
                    HStack(alignment: .top) {
                        Button {
                            if buttonNeedle[1] == false {
                                buttonNeedle[1] = true
                                buttonNeedle[0] = false
                            }
                            else {
                                buttonNeedle[1] = false
                            }
                        } label: {
                            if buttonNeedle[1] == false {
                                Image(systemName: "square")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.black)
                            }
                            else {
                                Image(systemName: "checkmark.square")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.black)
                            }
                        }.padding(.leading, 5).padding(.top, 3)
                        Text("I do NOT give consent for the use of Functional Dry Needling (FDN) as part of my treatment and hereby refuse this service.")
                            .padding(.bottom)
                    }
                }
                VStack(alignment: .leading) {
                    Text("Are you pregnant?")
                        .bold()
                        .font(.title3)
                    HStack(alignment: .top) {
                        Button {
                            if buttonNeedle[2] == false {
                                buttonNeedle[2] = true
                                buttonNeedle[3] = false
                                buttonNeedle[4] = false
                            }
                            else {
                                buttonNeedle[2] = false
                            }
                        } label: {
                            if buttonNeedle[2] == false {
                                Image(systemName: "square")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.black)
                            }
                            else {
                                Image(systemName: "checkmark.square")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.black)
                            }
                        }.padding(.leading, 5)
                        Text("Yes").padding(.trailing)
                        Button {
                            if buttonNeedle[3] == false {
                                buttonNeedle[3] = true
                                buttonNeedle[2] = false
                                buttonNeedle[4] = false
                            }
                            else {
                                buttonNeedle[3] = false
                            }
                        } label: {
                            if buttonNeedle[3] == false {
                                Image(systemName: "square")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.black)
                            }
                            else {
                                Image(systemName: "checkmark.square")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.black)
                            }
                        }
                        Text("No").padding(.trailing)
                        Button {
                            if buttonNeedle[4] == false {
                                buttonNeedle[4] = true
                                buttonNeedle[2] = false
                                buttonNeedle[3] = false
                            }
                            else {
                                buttonNeedle[4] = false
                            }
                        } label: {
                            if buttonNeedle[4] == false {
                                Image(systemName: "square")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.black)
                            }
                            else {
                                Image(systemName: "checkmark.square")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.black)
                            }
                        }
                        Text("Does not apply")
                        
                        
                    }
                    Text("Are you immunocompromised?")
                        .bold()
                        .font(.title3)
                    HStack(alignment: .top) {
                        Button {
                            if buttonNeedle[5] == false {
                                buttonNeedle[5] = true
                                buttonNeedle[6] = false
                            }
                            else {
                                buttonNeedle[5] = false
                            }
                        } label: {
                            if buttonNeedle[5] == false {
                                Image(systemName: "square")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.black)
                            }
                            else {
                                Image(systemName: "checkmark.square")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.black)
                            }
                        }.padding(.leading, 5)
                        Text("Yes").padding(.trailing)
                        Button {
                            if buttonNeedle[6] == false {
                                buttonNeedle[6] = true
                                buttonNeedle[5] = false
                            }
                            else {
                                buttonNeedle[6] = false
                            }
                        } label: {
                            if buttonNeedle[6] == false {
                                Image(systemName: "square")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.black)
                            }
                            else {
                                Image(systemName: "checkmark.square")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.black)
                            }
                        }
                        Text("No").padding(.trailing)
                        
                    }
                    Text("Are you taking blood thinners?")
                        .bold()
                        .font(.title3)
                    HStack(alignment: .top) {
                        Button {
                            if buttonNeedle[7] == false {
                                buttonNeedle[7] = true
                                buttonNeedle[8] = false
                            }
                            else {
                                buttonNeedle[7] = false
                            }
                        } label: {
                            if buttonNeedle[7] == false {
                                Image(systemName: "square")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.black)
                            }
                            else {
                                Image(systemName: "checkmark.square")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.black)
                            }
                        }.padding(.leading, 5)
                        Text("Yes").padding(.trailing)
                        Button {
                            if buttonNeedle[8] == false {
                                buttonNeedle[8] = true
                                buttonNeedle[7] = false
                            }
                            else {
                                buttonNeedle[8] = false
                            }
                        } label: {
                            if buttonNeedle[8] == false {
                                Image(systemName: "square")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.black)
                            }
                            else {
                                Image(systemName: "checkmark.square")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.black)
                            }
                        }
                        Text("No").padding(.trailing)
                        
                    }
                    if signatureNeedle == "" {
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
                            TextField("Sign Here", text: $signatureNeedle)
                                .frame(width: 300)
                                .padding(.leading, 20)
                                .accentColor(.black)
                                .textFieldStyle(.roundedBorder)
                            Text("Date: ")
                            .padding(.leading)
                            Text(Date().addingTimeInterval(600), style: .date)
                                    .padding(.leading)
                            
                            
                        
                    }.padding(.bottom)
                    Text("You have the right to withdraw consent for this procedure at any time before it is performed.")
                }
            }.padding()
        }.onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
}

struct DryNeedlingConsentView_Previews: PreviewProvider {
    static var previews: some View {
        DryNeedlingConsentView()
    }
}
