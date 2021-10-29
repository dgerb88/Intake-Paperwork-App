//
//  InformationAndPoliciesView.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 10/28/21.
//

import SwiftUI

struct InformationAndPoliciesView: View {
    
    @State var button = [false, false, false, false, false]
    @State var signatures = [false, false]

    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(5)
                .shadow(radius: 5)
            VStack {
                VStack(alignment: .leading) {
                    Text("Please thoroughly fill out this form. All information in kept completely confidential. This information is necessary in order to give you the most effective treatment for your personal case. ")
                        .bold()
                    // Emergency contact name
                    //Emergency contact phone number
                    //Emergency contect relation to patient
                    //How would you like to receive appointment reminders?
                        //Text, email, call picker
                    Text("Important Rules and Policies:")
                        .bold()
                        .font(.headline)
                        .padding(.bottom, 20)
                    Text("Please check the box to indicate that you understand the following:")
                        .bold()
                        .padding(.bottom)
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
                                        .foregroundColor(.black)
                                }
                                else {
                                    Image(systemName: "checkmark.square")
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
                                        .foregroundColor(.black)
                                }
                                else {
                                    Image(systemName: "checkmark.square")
                                        .foregroundColor(.black)
                                }
                            }
                            Text("2. Cancel/No Show Policy: Please call our office if you cannot come to an appointment already scheduled. 24-hour advance notice is required for changes to your appointment. Giving less than 24-hour notice of appointment changes will result in a $20 LATE CANCEL fee added to your account. Failure to call or show for an appointment will result in a $50 NO-SHOW fee added to your account.")
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
                                        .foregroundColor(.black)
                                }
                                else {
                                    Image(systemName: "checkmark.square")
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
                                        .foregroundColor(.black)
                                }
                                else {
                                    Image(systemName: "checkmark.square")
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
                                        .foregroundColor(.black)
                                }
                                else {
                                    Image(systemName: "checkmark.square")
                                        .foregroundColor(.black)
                                }
                            }
                            Text("5. If for any reason, you are not satisfied with the care received, please call us at (385) 255-8255 so we can resolve any issues.")
                        }
                    }.padding(.horizontal)
                    
                }.padding(.top).padding(.horizontal)
                VStack(alignment: .leading) {
                    Text("CONSENT TO PHYSICAL THERAPY EVALUATION AND TREATMENT:")
                        .bold()
                        .padding(.top)
                        .padding(.bottom, 5)
                    Text("By signing below, I hereby consent to the evaluation and treatment of my condition by a licensed physical therapist employed by Avista Physical Therapy. The physical therapist will explain the nature and purposes of these procedures, evaluation, and course of treatment. The physical therapist will inform me of expected benefits and complications, and any discomforts, and risk that may arise, as well as alternatives to the proposed treatment and the risk and consequences of no treatment.")
                    HStack {
                        Text("Electronic Signature of PATIENT or LEGAL GUARDIAN:")
                            .bold()
                        //User signature here

                        if signatures[0] == true {
                            ZStack {
                                Circle()
                                    .frame(width: 20, height: 20)
                                    .overlay(Circle().stroke(Color.init(.sRGB, red: 0, green: 0.42745, blue: 0.61961, opacity: 0.9), lineWidth: 1))
                                    .foregroundColor(.green)
                                Image(systemName: "checkmark")
                                    .foregroundColor(.white)
                            }
                            
                        }
                        
                    }.padding(.vertical)
                    Text("RELEASE FROM LIABILITY DISCLAIMER:")
                        .bold()
                        .padding(.top)
                        .padding(.bottom, 5)
                    Text("I fully understand and acknowledge that (a) the activities in which I will engage as part of the treatment provided by Avista Physical Therapy and the physical therapy activities and equipment I may use as a part of that treatment have inherent risks, dangers, and hazards and such exists in my use of any equipment and my participation in these activities; (b) my participation in such activities and/or use of such equipment may result in injury or illness including, but not limited to bodily injury, disease, strains, fractures, partial and/or total paralysis, death or other ailments that, could cause serious disability; (c) these risks and dangers may be caused by the negligence of the representatives or employees of Avista Physical Therapy, and any other entity, person, or associate, the negligence of the participants, the negligence of others, accidents, breaches of contract, or other causes. By my participation in these activities and for use of equipment, I hereby assume all risks and dangers and all responsibility for any losses and/or damages whether caused in whole or in part by the negligence or the conduct of the representatives or employees of Avista Physical Therapy, or by any other person. I, on behalf of myself, my personal representatives and my heirs, hereby voluntarily agree to release, waive, discharge, hold harmless, defend, and indemnify Avista Physical Therapy and their representatives, employees, and assigns from any and all claims, actions or losses for bodily injury, property damage, wrongful death, loss of services or otherwise which may arise out of my use of any equipment or participation in these activities. I specifically understand that I am releasing, discharging, and waiving any claims or actions that I may have presently or in the future for the negligent acts or other conduct by the representatives or employees of Avista Physical Therapy.")
                    Text("BY SIGNING BELOW, YOU ARE CONFIRMING THE FOLLOWING:")
                        .bold()
                        .padding(.vertical, 5)
                    Text("“I HAVE READ THE ABOVE WAIVER AND RELEASE AND BY SIGNING IT AGREE. IT IS MY INTENTION TO EXEMPT AND RELIEVE AVISTA PHYSICAL THERAPY FROM LIABILITY FOR PERSONAL INJURY, PROPERTY DAMAGE OR WRONGFUL DEATH CAUSED BY NEGLIGENCE OR ANY OTHER CAUSE.”")
                    HStack {
                        Text("Electronic Signature of PATIENT or LEGAL GUARDIAN:")
                            .bold()
                        //User signature here
                    }.padding(.vertical)
                }.padding(.horizontal).padding(.bottom)
            }
        }
    }
}

struct InformationAndPoliciesView_Previews: PreviewProvider {
    static var previews: some View {
        InformationAndPoliciesView()
    }
}