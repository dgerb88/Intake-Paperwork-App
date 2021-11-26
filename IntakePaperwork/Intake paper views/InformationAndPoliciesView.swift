//
//  InformationAndPoliciesView.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 10/28/21.
//

import SwiftUI

struct InformationAndPoliciesView: View {
    
    @EnvironmentObject var model:SurveyModel
    
    @State var button = [false, false, false, false, false]
    @State var signatures = ["", ""]
    @State var ContactName = ""
    @State var ContactPhoneNumber = ""
    @State var ContactRelation = ""
    @State var EmailAddress = ""

    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(5)
                .shadow(radius: 5)
            VStack {
                VStack(alignment: .leading) {
                    Text("Information and Policies")
                        .bold()
                        .font(.largeTitle)
                        .padding(.bottom, 30)
                    Text("Please thoroughly fill out this form. All information in kept completely confidential. This information is necessary in order to give you the most effective treatment for your personal case. ")
                        .bold()
                    HStack(alignment: .top, spacing: 50) {
                        VStack(alignment: .leading) {
                            Text("Emergency contact name: ")
                                .padding(.bottom, 15)
                                .padding(.top, 10)
                            Text("Emergency contact phone number: ")
                                .padding(.bottom, 15)
                            Text("Emergency contact relation to patient: ")
                                .padding(.bottom, 15)
                            Text("Personal Email address: ")
                                .padding(.top, 10)

                        }
                        VStack(alignment: .leading, spacing: 15) {
                            TextField("Name", text: $ContactName)
                                .padding(.leading, 20)
                                .accentColor(.black)
                                .textFieldStyle(.roundedBorder)
                            TextField("Phone Number", text: $ContactPhoneNumber)
                                .padding(.leading, 20)
                                .accentColor(.black)
                                .textFieldStyle(.roundedBorder)
                            TextField("Relationship", text: $ContactRelation)
                                .padding(.leading, 20)
                                .accentColor(.black)
                                .textFieldStyle(.roundedBorder)
                            TextField("Email address", text: $EmailAddress)
                                .padding(.leading, 20)
                                .accentColor(.black)
                                .textFieldStyle(.roundedBorder)
                        }.padding(.trailing, 30)
                    }.padding(.bottom)
                   
                    //How would you like to receive appointment reminders?
                        //Text, email, call picker
                    
                }.padding(.top).padding(.horizontal)
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
                                if button[0] == false {
                                    button[0] = true
                                }
                                else {
                                    button[0] = false
                                }
                            } label: {
                                if button[0] == false {
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
                        }
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
                            Text("2. Cancel/No Show Policy: Please call our office if you cannot come to an appointment already scheduled. 24-hour advance notice is required for changes to your appointment. Giving less than 24-hour notice of appointment changes will result in a $\(model.cancelFee) LATE CANCEL fee added to your account. Failure to call or show for an appointment will result in a $\(model.noShowFee) NO-SHOW fee added to your account.")
                        }
                        HStack(alignment: .top) {
                            Button {
                                if button[2] == false {
                                    button[2] = true
                                }
                                else {
                                    button[2] = false
                                }
                            } label: {
                                if button[2] == false {
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
                                if button[3] == false {
                                    button[3] = true
                                }
                                else {
                                    button[3] = false
                                }
                            } label: {
                                if button[3] == false {
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
                        }
                        HStack(alignment: .top) {
                            Button {
                                if button[4] == false {
                                    button[4] = true
                                }
                                else {
                                    button[4] = false
                                }
                            } label: {
                                if button[4] == false {
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
                    if signatures[0] == "" {
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
                        TextField("Sign Here", text: $signatures[0])
                            .frame(width: 300)
                            .padding(.leading, 20)
                            .accentColor(.black)
                            .textFieldStyle(.roundedBorder)
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
                    Text("BY SIGNING BELOW, YOU ARE CONFIRMING THE FOLLOWING:")
                        .bold()
                        .padding(.vertical, 5)
                    Text("“I HAVE READ THE ABOVE WAIVER AND RELEASE AND BY SIGNING IT AGREE. IT IS MY INTENTION TO EXEMPT AND RELIEVE \(model.clinicName.uppercased()) FROM LIABILITY FOR PERSONAL INJURY, PROPERTY DAMAGE OR WRONGFUL DEATH CAUSED BY NEGLIGENCE OR ANY OTHER CAUSE.”")
                    if signatures[1] == "" {
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
                            TextField("Sign Here", text: $signatures[1])
                                .frame(width: 300)
                                .padding(.leading, 20)
                                .accentColor(.black)
                                .textFieldStyle(.roundedBorder)
                            Text("Date: ")
                                .padding(.leading)
                            Text(Date().addingTimeInterval(600), style: .date)
                                    .padding(.leading)
                            
                        
                    }.padding(.bottom)
                }.padding(.horizontal).padding(.bottom)
            }
        }.onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
}

