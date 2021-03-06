//
//  InformationAndPoliciesView.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 10/28/21.
//

import SwiftUI

struct InformationAndPoliciesView: View {
    
    @EnvironmentObject var model:SurveyModel
    var survey: Survey
    @State var buttonInfo = [false, false, false, false, false]
    @State var signaturesInfo = ["", ""]
    @State var ContactNameInfo = ""
    @State var ContactPhoneNumberInfo = ""
    @State var ContactRelationInfo = ""
    @State var EmailAddressInfo = ""
    @FocusState var keyboardChange: Bool
    @State var personalNumber = ""
    @State var personalAddress = ""
    @State var birthDay = ["", "", ""]
    @State var showAlert = false
    @State var fillAlert = false
    @State var apptReminder = ""
    @State var howYouFind = ""

    var infoView: some View {
        ZStack {
            VStack {
                VStack(alignment: .center) {
                    Text("Information and Policies")
                        .bold()
                        .font(.largeTitle)
                        .padding(.bottom, 30)
                }.padding()
                VStack(alignment: .leading) {
                    
                    Text("Please thoroughly fill out this form. All information is kept completely confidential. This information is necessary in order to give you the most effective treatment for your personal case. ")
                        .bold()
                        .fixedSize(horizontal: false, vertical: true)
                    HStack(alignment: .top, spacing: 30) {
                        VStack(alignment: .leading) {
                            Text("Name:")
                                .padding(.top, 10)
                            TextField("Your name", text: $model.personalName)
                                .accentColor(.black)
                                .textFieldStyle(.roundedBorder)
                            Text("Birthday:")
                                .padding(.top, 10)
                            HStack {
                                TextField("MM", text: $birthDay[0])
                                    .accentColor(.black)
                                    .textFieldStyle(.roundedBorder)
                                    .frame(width: 45)
                                    .keyboardType(.numberPad)
                                Text("/")
                                TextField("DD", text: $birthDay[1])
                                    .accentColor(.black)
                                    .textFieldStyle(.roundedBorder)
                                    .frame(width: 40)
                                    .keyboardType(.numberPad)
                                Text("/")
                                TextField("YYYY", text: $birthDay[2])
                                    .accentColor(.black)
                                    .textFieldStyle(.roundedBorder)
                                    .frame(width: 60)
                                    .keyboardType(.numberPad)
                            }
                            Text("Phone Number: ")
                                .padding(.top, 10)
                                .keyboardType(.numberPad)
                            TextField("Your phone number", text: $personalNumber)
                                .accentColor(.black)
                                .textFieldStyle(.roundedBorder)
                            Text("House address")
                                .padding(.top, 10)
                            TextField("Your address", text: $personalAddress)
                                .accentColor(.black)
                                .textFieldStyle(.roundedBorder)
                            Text("Email address: ")
                                .padding(.top, 10)
                            TextField("Your email address", text: $EmailAddressInfo)
                                .accentColor(.black)
                                .textFieldStyle(.roundedBorder)
                        }.padding(.trailing, 30)
                        VStack(alignment: .leading) {
                            Group {
                                Text("Emergency contact name: ")
                                    .padding(.top, 10)
                                TextField("Name", text: $ContactNameInfo)
                                    .accentColor(.black)
                                    .textFieldStyle(.roundedBorder)
                                Text("Emergency contact phone number: ")
                                    .padding(.top, 10)
                                TextField("Phone Number", text: $ContactPhoneNumberInfo)
                                    .accentColor(.black)
                                    .textFieldStyle(.roundedBorder)
                                    .keyboardType(.numberPad)
                                Text("Emergency contact relation to patient: ")
                                    .padding(.top, 10)
                                TextField("Relationship", text: $ContactRelationInfo)
                                    .accentColor(.black)
                                    .textFieldStyle(.roundedBorder)
                                Text("How would you like to receive appointment reminders?")
                                    .padding(.top, 10)
                                    .fixedSize(horizontal: false, vertical: true)
                                TextField("Text, Email, Call", text: $apptReminder)
                                    .accentColor(.black)
                                    .textFieldStyle(.roundedBorder)
                                Text("How did you hear about us?")
                                    .padding(.top, 10)
                                TextField("Doctor, Insurance, Friend/Family, etc.", text: $howYouFind)
                                    .accentColor(.black)
                                    .textFieldStyle(.roundedBorder)
                            }
                            .pickerStyle(MenuPickerStyle())
                            .padding(.leading)
                            .accentColor(.blue)
                        }
                        
                    }.padding(.bottom)
                    
                }.padding(.horizontal)
                VStack(alignment: .leading) {
                    Text("Important Rules and Policies:")
                        .bold()
                        .font(.title)
                        .padding(.top, 20)
                        .padding(.bottom, 10)
                    Text("Please check the box to indicate that you understand the following:")
                        .bold()
                        .padding(.bottom)
                        .font(.title3)
                    VStack(alignment: .leading, spacing: 10) {
                        HStack(alignment: .top) {
                            Button {
                                if buttonInfo[0] == false {
                                    buttonInfo[0] = true
                                }
                                else {
                                    buttonInfo[0] = false
                                }
                            } label: {
                                if buttonInfo[0] == false {
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
                            Text("1. Late Policy: If you are more than 10-minutes late to your appointment, you may be rescheduled or asked to wait for next available open time slot.")
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        HStack(alignment: .top) {
                            Button {
                                if buttonInfo[1] == false {
                                    buttonInfo[1] = true
                                }
                                else {
                                    buttonInfo[1] = false
                                }
                            } label: {
                                if buttonInfo[1] == false {
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
                            Text("2. Cancel/No Show Policy: Please call our office if you cannot come to an appointment already scheduled. 24-hour advance notice is required for changes to your appointment. Giving less than 24-hour notice of appointment changes will result in up to a $\(model.cancelFee) LATE CANCEL fee added to your account. Failure to call or come to an appointment will result in a NO-SHOW fee up to the full price of your appointment added to your account.")
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        HStack(alignment: .top) {
                            Button {
                                if buttonInfo[2] == false {
                                    buttonInfo[2] = true
                                }
                                else {
                                    buttonInfo[2] = false
                                }
                            } label: {
                                if buttonInfo[2] == false {
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
                            Text("3. Co-pays and/or deductibles are due prior to each treatment session.")
                        }
                        HStack(alignment: .top) {
                            Button {
                                if buttonInfo[3] == false {
                                    buttonInfo[3] = true
                                }
                                else {
                                    buttonInfo[3] = false
                                }
                            } label: {
                                if buttonInfo[3] == false {
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
                            Text("4. If you are experiencing any financial hardship, please notify us immediately so we can create a payment program that is feasible.")
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        HStack(alignment: .top) {
                            Button {
                                if buttonInfo[4] == false {
                                    buttonInfo[4] = true
                                }
                                else {
                                    buttonInfo[4] = false
                                }
                            } label: {
                                if buttonInfo[4] == false {
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
                            Text("5. If for any reason, you are not satisfied with the care received, please call us at \(model.phoneNumber) so we can resolve any issues.")
                                .fixedSize(horizontal: false, vertical: true)
                        }
                    }.padding(.horizontal)
                }.padding(.horizontal)

                VStack(alignment: .leading) {
                    Text("CONSENT TO PHYSICAL THERAPY EVALUATION AND TREATMENT:")
                        .bold()
                        .padding(.top)
                        .padding(.bottom, 5)
                        .font(.title3)
                    Text("By signing below, I hereby consent to the evaluation and treatment of my condition by a licensed physical therapist employed by \(model.clinicName). The physical therapist will explain the nature and purposes of these procedures, evaluation, and course of treatment. The physical therapist will inform me of expected benefits and complications, and any discomforts, and risk that may arise, as well as alternatives to the proposed treatment and the risk and consequences of no treatment.")
                        .fixedSize(horizontal: false, vertical: true)
                    if signaturesInfo[0] == "" {
                        Text("Electronic Signature of PATIENT or LEGAL GUARDIAN:")
                            .bold()
                            .padding(.top, 10)
                            .padding(.bottom, 5)
                            .foregroundColor(.red)
                    }
                    else {
                        Text("Electronic Signature of PATIENT or LEGAL GUARDIAN:")
                            .bold()
                            .padding(.top, 10)
                            .padding(.bottom, 5)
                            .foregroundColor(.black)
                    }
                    HStack {
                        TextField("Sign Here", text: $signaturesInfo[0])
                            .frame(width: 300)
                            .padding(.leading, 20)
                            .accentColor(.black)
                            .textFieldStyle(.roundedBorder)
                            .focused($keyboardChange)
                        Text("Date: ")
                            .padding(.leading)
                        Text(Date().addingTimeInterval(600), style: .date)
                                .padding(.leading)
                        
                        
                    }
                    Text("RELEASE FROM LIABILITY DISCLAIMER:")
                        .bold()
                        .padding(.top)
                        .padding(.bottom, 5)
                        .font(.title3)
                    Text("I fully understand and acknowledge that (a) the activities in which I will engage as part of the treatment provided by \(model.clinicName) and the physical therapy activities and equipment I may use as a part of that treatment have inherent risks, dangers, and hazards and such exists in my use of any equipment and my participation in these activities; (b) my participation in such activities and/or use of such equipment may result in injury or illness including, but not limited to bodily injury, disease, strains, fractures, partial and/or total paralysis, death or other ailments that, could cause serious disability; (c) these risks and dangers may be caused by the negligence of the representatives or employees of \(model.clinicName), and any other entity, person, or associate, the negligence of the participants, the negligence of others, accidents, breaches of contract, or other causes. By my participation in these activities and for use of equipment, I hereby assume all risks and dangers and all responsibility for any losses and/or damages whether caused in whole or in part by the negligence or the conduct of the representatives or employees of \(model.clinicName), or by any other person. I, on behalf of myself, my personal representatives and my heirs, hereby voluntarily agree to release, waive, discharge, hold harmless, defend, and indemnify \(model.clinicName) and their representatives, employees, and assigns from any and all claims, actions or losses for bodily injury, property damage, wrongful death, loss of services or otherwise which may arise out of my use of any equipment or participation in these activities. I specifically understand that I am releasing, discharging, and waiving any claims or actions that I may have presently or in the future for the negligent acts or other conduct by the representatives or employees of \(model.clinicName).")
                        .fixedSize(horizontal: false, vertical: true)
                    Text("BY SIGNING BELOW, YOU ARE CONFIRMING THE FOLLOWING:")
                        .bold()
                        .padding(.vertical, 5)
                    Text("???I HAVE READ THE ABOVE WAIVER AND RELEASE AND BY SIGNING IT AGREE. IT IS MY INTENTION TO EXEMPT AND RELIEVE \(model.clinicName.uppercased()) FROM LIABILITY FOR PERSONAL INJURY, PROPERTY DAMAGE OR WRONGFUL DEATH CAUSED BY NEGLIGENCE OR ANY OTHER CAUSE.???")
                        .fixedSize(horizontal: false, vertical: true)
                    if signaturesInfo[1] == "" {
                        Text("Electronic Signature of PATIENT or LEGAL GUARDIAN:")
                            .bold()
                            .padding(.top, 10)
                            .padding(.bottom, 5)
                            .foregroundColor(.red)
                    }
                    else {
                        Text("Electronic Signature of PATIENT or LEGAL GUARDIAN:")
                            .bold()
                            .padding(.top, 10)
                            .padding(.bottom, 5)
                            .foregroundColor(.black)
                    }
                    HStack {
                            TextField("Sign Here", text: $signaturesInfo[1])
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
                }.padding(.horizontal).padding(.bottom)
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
                            infoView
                                .onDisappear {
                                    let image = infoView.snapshot()
                                    model.makeAddPdf(image: image)

                                }
                            if signaturesInfo[0] == "" || signaturesInfo[1] == "" || buttonInfo[0] == false || buttonInfo[1] == false || buttonInfo[2] == false || buttonInfo[3] == false || buttonInfo[4] == false {
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
                                    Alert(title: Text("Please sign areas in red and check all boxes before continuing"), dismissButton: .cancel(Text("Confirm")))
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
                                    if model.showPrivacyPolicy == true && model.includePrivacyPolicy == true {
                                        PrivacyPolicyView(survey: survey)
                                    }
                                    else if model.showDryNeedling == true && model.includeDryNeedlingConsent == true {
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

