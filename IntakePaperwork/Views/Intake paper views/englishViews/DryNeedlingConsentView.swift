//
//  DryNeedlingConsentView.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 10/28/21.
//

import SwiftUI

struct DryNeedlingConsentView: View {
    
    @EnvironmentObject var model:SurveyModel
    var survey: Survey
    
    @State var buttonNeedle = [false, false, false, false, false, false, false, false, false]
    @State var signatureNeedle = ""
    @FocusState var keyboardChange: Bool
    @State var showAlert = false
    @State var fillAlert = false
    
    var needleView: some View {
        ZStack {
            VStack {
                VStack(alignment: .center) {
                    Text("Dry Needling Consent Form")
                        .bold()
                        .font(.largeTitle)
                        .padding(.bottom, 30)
                }.padding()
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        
                        Text("Patient consent for function dry needling (FDN):")
                            .bold()
                            .font(.title2)
                            .padding(.bottom, 3)
                        Text("I understand that no guarantee or assurance has been made as to the results of this procedure and that it may not cure my condition. My therapist has also discussed with me the probability of success of this procedure, as well as the possibility of serious side effects. Multiple treatment sessions may be required/needed, thus this consent will cover this treatment as well as consecutive treatments by this facility. I have read and fully understand this consent form and understand that I should not sign this form until all items, including my questions, have been explained or answered to my satisfaction. With my signature, I hereby consent to the performance of this procedure. I also consent to any measures necessary to correct complications that may result.")
                            .fixedSize(horizontal: false, vertical: true)
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
                                .fixedSize(horizontal: false, vertical: true)
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
                                .fixedSize(horizontal: false, vertical: true)
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
                                    .focused($keyboardChange)

                                Text("Date: ")
                                .padding(.leading)
                                Text(Date().addingTimeInterval(600), style: .date)
                                        .padding(.leading)
                        }.padding(.bottom)
                        Text("You have the right to withdraw consent for this procedure at any time before it is performed.")
                    }
                }.padding(.bottom).padding(.horizontal)
            }
        }.frame(width: UIScreen.main.bounds.width)
    }

    var body: some View {
        ZStack {
            BackgroundView()
            Rectangle()
                .foregroundColor(.white)
                .shadow(radius: 5)
                .padding(.top, UIScreen.main.bounds.width == 768 || UIScreen.main.bounds.width == 810 ? 0 : 15)
            VStack(spacing: 0) {
                Rectangle()
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width, height:  1)
                ScrollView {
                        VStack {
                            needleView
                                .onDisappear {
                                    let image = needleView.snapshot()
                                    model.makeAddPdf(image: image)

                            }
                            if signatureNeedle == "" {
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
                                        else if survey.name == "Berg Balance Scale" {
                                            BergBalance(survey: survey)
                                        }
                                        else {
                                            Text("Survey not found")
                                        }
                                    }
                                    else {
                                        FinishedView(survey: survey)
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
                keyboardChange = false
            }
            .padding(.bottom, keyboardChange ? UIScreen.main.bounds.height*3/15 : 0)
            .animation(.easeInOut(duration: 0.3), value: true)
    }
}

