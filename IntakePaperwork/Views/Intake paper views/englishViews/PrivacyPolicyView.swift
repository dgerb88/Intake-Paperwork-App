//
//  PrivacyPolicyView.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 10/28/21.
//

import SwiftUI

struct PrivacyPolicyView: View {
    
    @EnvironmentObject var model: SurveyModel
    @State var signaturePrivate = ""
    @State var buttonPrivate = [false, false]
    var survey: Survey
    @State var showAlert = false
    @State var fillAlert = false
    
    var privacyView: some View {
        ZStack {
            VStack {
                VStack(alignment: .center) {
                    Text("Notice of Privacy Practices")
                        .bold()
                        .font(.largeTitle)
                        .padding(.bottom, 30)
                }.padding()
                VStack(alignment: .leading) {
                    Text("Acknowledgement:")
                        .bold()
                        .font(.title2)
                        .padding(.bottom, 10)
                    HStack(alignment: .top) {
                        Button {
                            if buttonPrivate[0] == false {
                                buttonPrivate[0] = true
                            }
                            else {
                                buttonPrivate[0] = false
                            }
                        } label: {
                            if buttonPrivate[0] == false {
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
                            .fixedSize(horizontal: false, vertical: true)
                    }.padding(.bottom)
                    Text("Consent:")
                        .bold()
                        .font(.title2)
                        .padding(.bottom, 10)
                    HStack(alignment: .top) {
                        Button {
                            if buttonPrivate[1] == false {
                                buttonPrivate[1] = true
                            }
                            else {
                                buttonPrivate[1] = false
                            }
                        } label: {
                            if buttonPrivate[1] == false {
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
                            .fixedSize(horizontal: false, vertical: true)
                    }.padding(.bottom)
                    if signaturePrivate == "" {
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
                            TextField("Sign Here", text: $signaturePrivate)
                                .frame(width: 300)
                                .padding(.leading, 20)
                                .accentColor(.black)
                                .textFieldStyle(.roundedBorder)
                            Text("Date: ")
                            .padding(.leading)
                            Text(Date().addingTimeInterval(600), style: .date)
                                    .padding(.leading)
                    }
                }.padding(.bottom).padding(.horizontal)
            }
        }.frame(width: UIScreen.main.bounds.width).padding(.bottom)
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
                        privacyView.onDisappear {
                            let image = privacyView.snapshot()
                            model.makeAddPdf(image: image)

                        }
                        if signaturePrivate == "" {
                            Button {
                                fillAlert = true
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
                            }.alert(isPresented: $fillAlert) {
                                Alert(title: Text("Please sign areas in red before continuing"), dismissButton: .cancel(Text("Confirm")))
                            }
                            .navigationBarBackButtonHidden(true)
                            .navigationBarTitleDisplayMode(.inline)
                            .toolbar {
                                ToolbarItem(placement: .navigationBarLeading) {
                                    Button {
                                        showAlert = true
                                    } label: {
                                        Image(systemName: "house")
                                            .resizable(resizingMode: .tile)
                                            .frame(width: 30, height: 30)
                                            .foregroundColor(.white)
                                            .padding(.vertical, 20)
                                    }.alert(isPresented: $showAlert) {
                                        Alert(
                                           title: Text("Are you sure you wish to return home? Current progress will be lost."),
                                           primaryButton: .destructive(Text("Return home")) {
                                               model.viewSelectionInt = nil
                                           },
                                           secondaryButton: .cancel()
                                           
                                        )
                                    }
                                }
                            }

                        }
                        else {
                            NavigationLink {
                                if model.showDryNeedling == true && model.includeDryNeedlingConsent == true {
                                    DryNeedlingConsentView(survey: survey)
                                }
                                else {
                                    if model.includeSurvey {
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
                                    else {
                                        FinishedView(survey: survey)
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
                            }
                                .navigationBarBackButtonHidden(true)
                                .navigationBarTitleDisplayMode(.inline)
                                .toolbar {
                                    ToolbarItem(placement: .navigationBarLeading) {
                                        Button {
                                            showAlert = true
                                        } label: {
                                            Image(systemName: "house")
                                                .resizable(resizingMode: .tile)
                                                .frame(width: 30, height: 30)
                                                .foregroundColor(.white)
                                                .padding(.vertical, 20)
                                        }.alert(isPresented: $showAlert) {
                                            Alert(
                                               title: Text("Are you sure you wish to return home? Current progress will be lost."),
                                               primaryButton: .destructive(Text("Return home")) {
                                                   model.viewSelectionInt = nil
                                               },
                                               secondaryButton: .cancel()
                                               
                                            )
                                        }
                                    }
                                }
                        }
                        
                    }
                }
            }.padding(.top, UIScreen.main.bounds.width == 768 || UIScreen.main.bounds.width == 810 ? 0 : 15)
        }
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
}

