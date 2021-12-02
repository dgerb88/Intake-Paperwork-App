//
//  SurveyView.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 10/16/21.
//

import SwiftUI

struct SurveyView: View {
    
    @EnvironmentObject var model: SurveyModel
    var survey: Survey
    
    @State var primaryReason = 0
    @State var primaryReasonOther = ""
    @State var dateProblemStarted = ""
    @State private var button = [false, false, false, false, false, false, false, false, false, false, false]
    @State var button2 = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false]
    @State var diagnosticTesting = ""
    @State var secondReason = ""
    @State var historyCondition = "History"
    @State var dateSurgery = ""
    @State var typeSurgery = ""
    @State var dateNextDoc = ""
    @State var PTin12 = ""
    @State var weeksPregnant = ""
    @State var otherConditions = ""
    @State var medicationsList = "List"
    @State var occupation = ""
    @State var button3 = [false, false, false]
    @State var workRestrictions = ""
    @State var workDuties = "Duties"
    @State var button4 = [false, false]
    @State var timesFallen = ""
    @State var reasonFall = ""
    @State var button5 = [false, false]
    @State var signaturePrivate = ""
    @State var buttonPrivate = [false, false]
    @State var buttonNeedle = [false, false, false, false, false, false, false, false, false]
    @State var signatureNeedle = ""
    @State var patientNameInsurance = ""
    @State var InsuranceNameInsurance = ["", ""]
    @State var memberIdInsurance = ["", ""]
    @State var groupNumberInsurance = ["", ""]
    @State var signatureInsurance = ""
    @State var buttonInsurance = [false, false, false, false, false, false, false]
    @State var buttonInfo = [false, false, false, false, false]
    @State var signaturesInfo = ["", ""]
    @State var ContactNameInfo = ""
    @State var ContactPhoneNumberInfo = ""
    @State var ContactRelationInfo = ""
    @State var EmailAddressInfo = ""
    
    var medView: some View {
        ZStack {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text("Medical History")
                        .bold()
                        .font(.largeTitle)
                        .padding(.bottom, 30)
                }
                HStack(alignment: .top, spacing: 40) {
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            Text("Primary reason for visit:")
                                .font(Font.title3.weight(.bold))
                            Picker("", selection: $primaryReason) {
                                Text("Other").tag(7)
                                Text("Balance problems").tag(6)
                                Text("Hand problems").tag(4)
                                Text("Leg or foot problems").tag(5)
                                Text("Shoulder or arm problems").tag(3)
                                Text("Neck pain").tag(2)
                                Text("Back pain").tag(1)
                                Text("Please select").tag(0)
                            }
                                .pickerStyle(MenuPickerStyle())
                                .padding(.leading)
                            if primaryReason == 7 {
                                Text("Please describe:")
                                TextField("Reason", text: $primaryReasonOther)
                                    .accentColor(.black)
                                    .textFieldStyle(.roundedBorder)
                                    .padding(.bottom, 5)
                                    .frame(width: 350)
                            }
                            Text("Date condition began:")
                                .font(Font.title3.weight(.bold))
                                .padding(.top)
                            TextField("MM/DD/YYYY", text: $dateProblemStarted)
                                .accentColor(.black)
                                .textFieldStyle(.roundedBorder)
                                .padding(.bottom, 5)
                                .frame(width: 140)
                                .keyboardType(.numberPad)
                        }
                        VStack(alignment: .leading) {
                            Text("Is this a work-related injury?")
                                .font(Font.title3.weight(.bold))
                                .padding(.top)
                            HStack {
                                Button {
                                    if button[0] == false {
                                        button[0] = true
                                        button[1] = false
                                    }
                                } label: {
                                    if button[0] == true {
                                        Image(systemName: "checkmark.square")
                                            .foregroundColor(.black)
                                            .font(Font.headline.weight(.semibold))
                                        Text("Yes")
                                            .foregroundColor(.black)
                                            .font(Font.headline.weight(.semibold))
                                    }
                                    else {
                                        Image(systemName: "square")
                                            .foregroundColor(.black)
                                            .font(Font.body)
                                        Text("Yes")
                                            .foregroundColor(.black)
                                            .font(Font.body)
                                    }
                                }
                                Button {
                                    if button[1] == false {
                                        button[1] = true
                                        button[0] = false
                                    }
                                } label: {
                                    if button[1] == true {
                                        Image(systemName: "checkmark.square")
                                            .foregroundColor(.black)
                                            .font(Font.headline.weight(.semibold))
                                        Text("No")
                                            .foregroundColor(.black)
                                            .font(Font.headline.weight(.semibold))
                                    }
                                    else {
                                        Image(systemName: "square")
                                            .foregroundColor(.black)
                                            .font(Font.body)
                                        Text("No")
                                            .foregroundColor(.black)
                                            .font(Font.body)
                                    }
                                }
                            }.padding(.top, 5)
                        }
                        VStack(alignment: .leading) {
                            Text("Date of surgery (if applicable):")
                                .font(Font.title3.weight(.bold))
                                .padding(.top)
                            TextField("MM/DD/YYYY", text: $dateSurgery)
                                .accentColor(.black)
                                .textFieldStyle(.roundedBorder)
                                .padding(.bottom, 5)
                                .frame(width: 140)
                                .keyboardType(.numberPad)
                            if dateSurgery != "" {
                                Text("Type of surgery:")
                                    .font(Font.title3.weight(.bold))
                                    .padding(.top)
                                TextField("Surgery type", text: $typeSurgery)
                                    .accentColor(.black)
                                    .textFieldStyle(.roundedBorder)
                                    .frame(width: 350)
                            }
                            Text("Date of next doctor appointment for this condition:")
                                .font(Font.title3.weight(.bold))
                                .padding(.top)
                                .fixedSize(horizontal: false, vertical: true)
                            TextField("MM/DD/YYYY", text: $dateNextDoc)
                                .accentColor(.black)
                                .textFieldStyle(.roundedBorder)
                                .padding(.bottom, 5)
                                .frame(width: 140)
                                .keyboardType(.numberPad)
                        }
                        VStack(alignment: .leading) {
                            Text("Have you had any diagnostic tests related to this condition? i.e. X-Ray, MRI, Ultrasound, etc.")
                                .font(Font.title3.weight(.bold))
                                .fixedSize(horizontal: false, vertical: true)
                            HStack {
                                Button {
                                    if button[2] == false {
                                        button[2] = true
                                        button[3] = false
                                    }
                                } label: {
                                    if button[2] == true {
                                        Image(systemName: "checkmark.square")
                                            .foregroundColor(.black)
                                            .font(Font.headline.weight(.semibold))
                                        Text("Yes")
                                            .foregroundColor(.black)
                                            .font(Font.headline.weight(.semibold))
                                    }
                                    else {
                                        Image(systemName: "square")
                                            .foregroundColor(.black)
                                            .font(Font.body)
                                        Text("Yes")
                                            .foregroundColor(.black)
                                            .font(Font.body)
                                    }
                                }
                                Button {
                                    if button[3] == false {
                                        button[3] = true
                                        button[2] = false
                                    }
                                } label: {
                                    if button[3] == true {
                                        Image(systemName: "checkmark.square")
                                            .foregroundColor(.black)
                                            .font(Font.headline.weight(.semibold))
                                        Text("No")
                                            .foregroundColor(.black)
                                            .font(Font.headline.weight(.semibold))
                                    }
                                    else {
                                        Image(systemName: "square")
                                            .foregroundColor(.black)
                                            .font(Font.body)
                                        Text("No")
                                            .foregroundColor(.black)
                                            .font(Font.body)
                                    }
                                }
                            }.padding(.vertical, 5)
                            if button[2] {
                                Text("What were the results?")
                                TextField("Results", text: $diagnosticTesting)
                                    .accentColor(.black)
                                    .textFieldStyle(.roundedBorder)
                                    .frame(width: 350)
                            }
                        }
                    }
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            Text("Secondary reason for visit (if applicable):")
                                .padding(.bottom, 5)
                                .font(Font.title3.weight(.bold))
                                .fixedSize(horizontal: false, vertical: true)
                            TextField("Reason", text: $secondReason)
                                .accentColor(.black)
                                .textFieldStyle(.roundedBorder)
                                .frame(width: 350)
                            Text("Please describe the onset and history of current condition(s):")
                                .padding(.top)
                                .padding(.bottom, 5)
                                .font(Font.title3.weight(.bold))
                                .fixedSize(horizontal: false, vertical: true)
                            TextEditor(text: $historyCondition)
                                .foregroundColor(historyCondition == "History" ? Color.gray.opacity(0.5) : .black)
                                .frame(width: 350, height: 75)
                                .border(Color.init(.sRGB, red: 0.92941, green: 0.92941, blue: 0.92941, opacity: 1), width: 1)
                                .onTapGesture {
                                    if historyCondition == "History" {
                                        historyCondition = ""
                                    }
                                }
                        }
                        VStack(alignment: .leading) {
                            Text("Have you received physical therapy in the last 12 months?")
                                .padding(.top)
                                .padding(.bottom, 5)
                                .font(Font.title3.weight(.bold))
                                .fixedSize(horizontal: false, vertical: true)
                            HStack {
                                Button {
                                    if button[4] == false {
                                        button[4] = true
                                        button[5] = false
                                    }
                                } label: {
                                    if button[4] == true {
                                        Image(systemName: "checkmark.square")
                                            .foregroundColor(.black)
                                            .font(Font.headline.weight(.semibold))
                                        Text("Yes")
                                            .foregroundColor(.black)
                                            .font(Font.headline.weight(.semibold))
                                    }
                                    else {
                                        Image(systemName: "square")
                                            .foregroundColor(.black)
                                            .font(Font.body)
                                        Text("Yes")
                                            .foregroundColor(.black)
                                            .font(Font.body)
                                    }
                                }
                                Button {
                                    if button[5] == false {
                                        button[5] = true
                                        button[4] = false
                                    }
                                } label: {
                                    if button[5] == true {
                                        Image(systemName: "checkmark.square")
                                            .foregroundColor(.black)
                                            .font(Font.headline.weight(.semibold))
                                        Text("No")
                                            .foregroundColor(.black)
                                            .font(Font.headline.weight(.semibold))
                                    }
                                    else {
                                        Image(systemName: "square")
                                            .foregroundColor(.black)
                                            .font(Font.body)
                                        Text("No")
                                            .foregroundColor(.black)
                                            .font(Font.body)
                                    }
                                }
                            }.padding(.vertical, 5)
                            if button[4] {
                                Text("For what condition(s)?")
                                    .padding(.vertical, 5)
                                TextField("Reason", text: $PTin12)
                                    .accentColor(.black)
                                    .textFieldStyle(.roundedBorder)
                                    .frame(width: 350)
                            }
                            Text("Do you have a pacemaker?")
                                .padding(.top)
                                .padding(.bottom, 5)
                                .font(Font.title3.weight(.bold))
                            HStack {
                                Button {
                                    if button[6] == false {
                                        button[6] = true
                                        button[7] = false
                                    }
                                } label: {
                                    if button[6] == true {
                                        Image(systemName: "checkmark.square")
                                            .foregroundColor(.black)
                                            .font(Font.headline.weight(.semibold))
                                        Text("Yes")
                                            .foregroundColor(.black)
                                            .font(Font.headline.weight(.semibold))
                                    }
                                    else {
                                        Image(systemName: "square")
                                            .foregroundColor(.black)
                                            .font(Font.body)
                                        Text("Yes")
                                            .foregroundColor(.black)
                                            .font(Font.body)
                                    }
                                }
                                Button {
                                    if button[7] == false {
                                        button[7] = true
                                        button[6] = false
                                    }
                                } label: {
                                    if button[7] == true {
                                        Image(systemName: "checkmark.square")
                                            .foregroundColor(.black)
                                            .font(Font.headline.weight(.semibold))
                                        Text("No")
                                            .foregroundColor(.black)
                                            .font(Font.headline.weight(.semibold))
                                    }
                                    else {
                                        Image(systemName: "square")
                                            .foregroundColor(.black)
                                            .font(Font.body)
                                        Text("No")
                                            .foregroundColor(.black)
                                            .font(Font.body)
                                    }
                                }
                            }.padding(.vertical, 5)
                            Text("Are you currently pregnant?")
                                .padding(.top)
                                .padding(.bottom, 5)
                                .font(Font.title3.weight(.bold))
                            HStack {
                                Button {
                                    if button[8] == false {
                                        button[8] = true
                                        button[9] = false
                                        button[10] = false
                                    }
                                } label: {
                                    if button[8] == true {
                                        Image(systemName: "checkmark.square")
                                            .foregroundColor(.black)
                                            .font(Font.headline.weight(.semibold))
                                        Text("Yes")
                                            .foregroundColor(.black)
                                            .font(Font.headline.weight(.semibold))
                                    }
                                    else {
                                        Image(systemName: "square")
                                            .foregroundColor(.black)
                                            .font(Font.body)
                                        Text("Yes")
                                            .foregroundColor(.black)
                                            .font(Font.body)
                                    }
                                }
                                Button {
                                    if button[9] == false {
                                        button[9] = true
                                        button[8] = false
                                        button[10] = false
                                    }
                                } label: {
                                    if button[9] == true {
                                        Image(systemName: "checkmark.square")
                                            .foregroundColor(.black)
                                            .font(Font.headline.weight(.semibold))
                                        Text("No")
                                            .foregroundColor(.black)
                                            .font(Font.headline.weight(.semibold))
                                    }
                                    else {
                                        Image(systemName: "square")
                                            .foregroundColor(.black)
                                            .font(Font.body)
                                        Text("No")
                                            .foregroundColor(.black)
                                            .font(Font.body)
                                    }
                                }
                                Button {
                                    if button[10] == false {
                                        button[10] = true
                                        button[8] = false
                                        button[9] = false
                                    }
                                } label: {
                                    if button[10] == true {
                                        Image(systemName: "checkmark.square")
                                            .foregroundColor(.black)
                                            .font(Font.headline.weight(.semibold))
                                        Text("N/A")
                                            .foregroundColor(.black)
                                            .font(Font.headline.weight(.semibold))
                                    }
                                    else {
                                        Image(systemName: "square")
                                            .foregroundColor(.black)
                                            .font(Font.body)
                                        Text("N/A")
                                            .foregroundColor(.black)
                                            .font(Font.body)
                                    }
                                }
                            }.padding(.vertical, 5)
                            if button[8] {
                                Text("How many weeks?")
                                    .padding(.vertical, 5)
                                TextField("Weeks", text: $weeksPregnant)
                                    .accentColor(.black)
                                    .textFieldStyle(.roundedBorder)
                                    .frame(width: 350)
                                    .keyboardType(.numberPad)
                                
                            }

                            
                        }
                    }
                }
                Divider().padding(.vertical)
                VStack(alignment: .leading) {
                    Text("Please mark any conditions you have a PERSONAL history of(not family history):")
                        .font(Font.title3.weight(.bold))
                }
                HStack(alignment: .top, spacing: 5) {
                    VStack(alignment: .leading, spacing: 3) {
                        VStack(alignment: .leading, spacing: 3) {
                            HStack(alignment: .top) {
                                Button {
                                    if button2[0] {
                                        button2[0] = false
                                    }
                                    else {
                                        button2[0] = true
                                    }
                                } label: {
                                    if button2[0] {
                                        Image(systemName: "checkmark.square")
                                    }
                                    else {
                                        Image(systemName: "square")
                                    }
                                }
                                Text("Abnormal bleeding")
                            }.foregroundColor(.black)
                            HStack(alignment: .top) {
                                Button {
                                    if button2[1] {
                                        button2[1] = false
                                    }
                                    else {
                                        button2[1] = true
                                    }
                                } label: {
                                    if button2[1] {
                                        Image(systemName: "checkmark.square")
                                    }
                                    else {
                                        Image(systemName: "square")
                                    }
                                }
                                Text("Angina(chest pain")
                            }
                                .foregroundColor(.black)
                            HStack(alignment: .top) {
                                Button {
                                    if button2[2] {
                                        button2[2] = false
                                    }
                                    else {
                                        button2[2] = true
                                    }
                                } label: {
                                    if button2[2] {
                                        Image(systemName: "checkmark.square")
                                    }
                                    else {
                                        Image(systemName: "square")
                                    }
                                }
                                Text("Anxiety")
                            }
                                .foregroundColor(.black)
                            HStack(alignment: .top) {
                                Button {
                                    if button2[3] {
                                        button2[3] = false
                                    }
                                    else {
                                        button2[3] = true
                                    }
                                } label: {
                                    if button2[3] {
                                        Image(systemName: "checkmark.square")
                                    }
                                    else {
                                        Image(systemName: "square")
                                    }
                                }
                                Text("Arrythmia")
                            }
                                .foregroundColor(.black)
                            HStack(alignment: .top) {
                                Button {
                                    if button2[4] {
                                        button2[4] = false
                                    }
                                    else {
                                        button2[4] = true
                                    }
                                } label: {
                                    if button2[4] {
                                        Image(systemName: "checkmark.square")
                                    }
                                    else {
                                        Image(systemName: "square")
                                    }                                    }
                                Text("Asthma")
                            }
                                .foregroundColor(.black)
                            HStack(alignment: .top) {
                                Button {
                                    if button2[5] {
                                        button2[5] = false
                                    }
                                    else {
                                        button2[5] = true
                                    }
                                } label: {
                                    if button2[5] {
                                        Image(systemName: "checkmark.square")
                                    }
                                    else {
                                        Image(systemName: "square")
                                    }                                    }
                                Text("Bipolar")
                            }
                                .foregroundColor(.black)
                            HStack(alignment: .top) {
                                Button {
                                    if button2[6] {
                                        button2[6] = false
                                    }
                                    else {
                                        button2[6] = true
                                    }
                                } label: {
                                    if button2[6] {
                                        Image(systemName: "checkmark.square")
                                    }
                                    else {
                                        Image(systemName: "square")
                                    }                                    }
                                Text("Blood clotting disorder")
                            }
                                .foregroundColor(.black)
                        }
                        VStack(alignment: .leading, spacing: 3) {
                            HStack(alignment: .top) {
                                Button {
                                    if button2[7] {
                                        button2[7] = false
                                    }
                                    else {
                                        button2[7] = true
                                    }
                                } label: {
                                    if button2[7] {
                                        Image(systemName: "checkmark.square")
                                    }
                                    else {
                                        Image(systemName: "square")
                                    }
                                }
                                Text("Bowel incontinence")
                            }.foregroundColor(.black)
                            HStack(alignment: .top) {
                                Button {
                                    if button2[8] {
                                        button2[8] = false
                                    }
                                    else {
                                        button2[8] = true
                                    }
                                } label: {
                                    if button2[8] {
                                        Image(systemName: "checkmark.square")
                                    }
                                    else {
                                        Image(systemName: "square")
                                    }
                                }
                                Text("Cancer")
                            }.foregroundColor(.black)
                            HStack(alignment: .top) {
                                Button {
                                    if button2[9] {
                                        button2[9] = false
                                    }
                                    else {
                                        button2[9] = true
                                    }
                                } label: {
                                    if button2[9] {
                                        Image(systemName: "checkmark.square")
                                    }
                                    else {
                                        Image(systemName: "square")
                                    }
                                }
                                Text("Cellulitis")
                            }.foregroundColor(.black)
                            HStack(alignment: .top) {
                                Button {
                                    if button2[10] {
                                        button2[10] = false
                                    }
                                    else {
                                        button2[10] = true
                                    }
                                } label: {
                                    if button2[10] {
                                        Image(systemName: "checkmark.square")
                                    }
                                    else {
                                        Image(systemName: "square")
                                    }
                                }
                                Text("Chronic back pain")
                            }.foregroundColor(.black)
                            HStack(alignment: .top) {
                                Button {
                                    if button2[11] {
                                        button2[11] = false
                                    }
                                    else {
                                        button2[11] = true
                                    }
                                } label: {
                                    if button2[11] {
                                        Image(systemName: "checkmark.square")
                                    }
                                    else {
                                        Image(systemName: "square")
                                    }
                                }
                                Text("Chronic neck pain")
                            }.foregroundColor(.black)
                            HStack(alignment: .top) {
                                Button {
                                    if button2[12] {
                                        button2[12] = false
                                    }
                                    else {
                                        button2[12] = true
                                    }
                                } label: {
                                    if button2[12] {
                                        Image(systemName: "checkmark.square")
                                    }
                                    else {
                                        Image(systemName: "square")
                                    }
                                }
                                Text("Crohn's Disease")
                            }.foregroundColor(.black)
                            HStack(alignment: .top) {
                                Button {
                                    if button2[13] {
                                        button2[13] = false
                                    }
                                    else {
                                        button2[13] = true
                                    }
                                } label: {
                                    if button2[13] {
                                        Image(systemName: "checkmark.square")
                                    }
                                    else {
                                        Image(systemName: "square")
                                    }
                                }
                                Text("Closed head injury")
                            }.foregroundColor(.black)
                            HStack(alignment: .top) {
                                Button {
                                    if button2[14] {
                                        button2[14] = false
                                    }
                                    else {
                                        button2[14] = true
                                    }
                                } label: {
                                    if button2[14] {
                                        Image(systemName: "checkmark.square")
                                    }
                                    else {
                                        Image(systemName: "square")
                                    }
                                }
                                Text("Colitis")
                            }.foregroundColor(.black)
                        }
                    }
                        .fixedSize(horizontal: false, vertical: true)
                    VStack(alignment: .leading, spacing: 3) {
                        VStack(alignment: .leading, spacing: 3) {
                            HStack(alignment: .top) {
                                Button {
                                    if button2[15] {
                                        button2[15] = false
                                    }
                                    else {
                                        button2[15] = true
                                    }
                                } label: {
                                    if button2[15] {
                                        Image(systemName: "checkmark.square")
                                    }
                                    else {
                                        Image(systemName: "square")
                                    }
                                }
                                Text("Congestive Heart Failure")
                            }.foregroundColor(.black)
                            HStack(alignment: .top) {
                                Button {
                                    if button2[16] {
                                        button2[16] = false
                                    }
                                    else {
                                        button2[16] = true
                                    }
                                } label: {
                                    if button2[16] {
                                        Image(systemName: "checkmark.square")
                                    }
                                    else {
                                        Image(systemName: "square")
                                    }
                                }
                                Text("COPD")
                            }.foregroundColor(.black)
                            HStack(alignment: .top) {
                                Button {
                                    if button2[17] {
                                        button2[17] = false
                                    }
                                    else {
                                        button2[17] = true
                                    }
                                } label: {
                                    if button2[17] {
                                        Image(systemName: "checkmark.square")
                                    }
                                    else {
                                        Image(systemName: "square")
                                    }
                                }
                                Text("CVA(stroke)")
                            }.foregroundColor(.black)
                            HStack(alignment: .top) {
                                Button {
                                    if button2[18] {
                                        button2[18] = false
                                    }
                                    else {
                                        button2[18] = true
                                    }
                                } label: {
                                    if button2[18] {
                                        Image(systemName: "checkmark.square")
                                    }
                                    else {
                                        Image(systemName: "square")
                                    }
                                }
                                Text("Degenerative Disc Disease")
                            }.foregroundColor(.black)
                            HStack(alignment: .top) {
                                Button {
                                    if button2[19] {
                                        button2[19] = false
                                    }
                                    else {
                                        button2[19] = true
                                    }
                                } label: {
                                    if button2[19] {
                                        Image(systemName: "checkmark.square")
                                    }
                                    else {
                                        Image(systemName: "square")
                                    }
                                }
                                Text("Depression")
                            }.foregroundColor(.black)
                            HStack(alignment: .top) {
                                Button {
                                    if button2[20] {
                                        button2[20] = false
                                    }
                                    else {
                                        button2[20] = true
                                    }
                                } label: {
                                    if button2[20] {
                                        Image(systemName: "checkmark.square")
                                    }
                                    else {
                                        Image(systemName: "square")
                                    }
                                }
                                Text("Diabetes(Type 1)")
                            }.foregroundColor(.black)
                        }
                        VStack(alignment: .leading, spacing: 3) {
                            HStack(alignment: .top) {
                                Button {
                                    if button2[21] {
                                        button2[21] = false
                                    }
                                    else {
                                        button2[21] = true
                                    }
                                } label: {
                                    if button2[21] {
                                        Image(systemName: "checkmark.square")
                                    }
                                    else {
                                        Image(systemName: "square")
                                    }
                                }

                                Text("Diabetes(Type 2")
                            }.foregroundColor(.black)
                            HStack(alignment: .top) {
                                Button {
                                    if button2[22] {
                                        button2[22] = false
                                    }
                                    else {
                                        button2[22] = true
                                    }
                                } label: {
                                    if button2[22] {
                                        Image(systemName: "checkmark.square")
                                    }
                                    else {
                                        Image(systemName: "square")
                                    }
                                }

                                Text("DVT(Deep Vein Thrombosis)")
                            }.foregroundColor(.black)
                            HStack(alignment: .top) {
                                Button {
                                    if button2[23] {
                                        button2[23] = false
                                    }
                                    else {
                                        button2[23] = true
                                    }
                                } label: {
                                    if button2[23] {
                                        Image(systemName: "checkmark.square")
                                    }
                                    else {
                                        Image(systemName: "square")
                                    }
                                }

                                Text("Fibromyalgia")
                            }.foregroundColor(.black)
                            HStack(alignment: .top) {
                                Button {
                                    if button2[24] {
                                        button2[24] = false
                                    }
                                    else {
                                        button2[24] = true
                                    }
                                } label: {
                                    if button2[24] {
                                        Image(systemName: "checkmark.square")
                                    }
                                    else {
                                        Image(systemName: "square")
                                    }
                                }

                                Text("Frequent UTI")
                            }.foregroundColor(.black)
                            HStack(alignment: .top) {
                                Button {
                                    if button2[25] {
                                        button2[25] = false
                                    }
                                    else {
                                        button2[25] = true
                                    }
                                } label: {
                                    if button2[25] {
                                        Image(systemName: "checkmark.square")
                                    }
                                    else {
                                        Image(systemName: "square")
                                    }
                                }

                                Text("GERD")
                            }.foregroundColor(.black)
                            HStack(alignment: .top) {
                                Button {
                                    if button2[26] {
                                        button2[26] = false
                                    }
                                    else {
                                        button2[26] = true
                                    }
                                } label: {
                                    if button2[26] {
                                        Image(systemName: "checkmark.square")
                                    }
                                    else {
                                        Image(systemName: "square")
                                    }
                                }

                                Text("Glaucoma")
                            }.foregroundColor(.black)
                            HStack(alignment: .top) {
                                Button {
                                    if button2[27] {
                                        button2[27] = false
                                    }
                                    else {
                                        button2[27] = true
                                    }
                                } label: {
                                    if button2[27] {
                                        Image(systemName: "checkmark.square")
                                    }
                                    else {
                                        Image(systemName: "square")
                                    }
                                }

                                Text("Gout")
                            }.foregroundColor(.black)
                        }
                    }
                        .fixedSize(horizontal: false, vertical: true)
                    VStack(alignment: .leading, spacing: 3) {
                        VStack(alignment: .leading, spacing: 3) {
                            HStack(alignment: .top) {
                                Button {
                                    if button2[28] {
                                        button2[28] = false
                                    }
                                    else {
                                        button2[28] = true
                                    }
                                } label: {
                                    if button2[28] {
                                        Image(systemName: "checkmark.square")
                                    }
                                    else {
                                        Image(systemName: "square")
                                    }
                                }
                                Text("Heart Disease")
                            }.foregroundColor(.black)
                            HStack(alignment: .top) {
                                Button {
                                    if button2[29] {
                                        button2[29] = false
                                    }
                                    else {
                                        button2[29] = true
                                    }
                                } label: {
                                    if button2[29] {
                                        Image(systemName: "checkmark.square")
                                    }
                                    else {
                                        Image(systemName: "square")
                                    }
                                }
                                Text("Hepatitis B")
                            }.foregroundColor(.black)
                            HStack(alignment: .top) {
                                Button {
                                    if button2[30] {
                                        button2[30] = false
                                    }
                                    else {
                                        button2[30] = true
                                    }
                                } label: {
                                    if button2[30] {
                                        Image(systemName: "checkmark.square")
                                    }
                                    else {
                                        Image(systemName: "square")
                                    }
                                }
                                Text("Hepatitis C")
                            }.foregroundColor(.black)
                            HStack(alignment: .top) {
                                Button {
                                    if button2[31] {
                                        button2[31] = false
                                    }
                                    else {
                                        button2[31] = true
                                    }
                                } label: {
                                    if button2[31] {
                                        Image(systemName: "checkmark.square")
                                    }
                                    else {
                                        Image(systemName: "square")
                                    }
                                }
                                Text("Hiatal Hernia")
                            }.foregroundColor(.black)
                            HStack(alignment: .top) {
                                Button {
                                    if button2[32] {
                                        button2[32] = false
                                    }
                                    else {
                                        button2[32] = true
                                    }
                                } label: {
                                    if button2[32] {
                                        Image(systemName: "checkmark.square")
                                    }
                                    else {
                                        Image(systemName: "square")
                                    }
                                }
                                Text("High Cholesterol")
                            }.foregroundColor(.black)
                            HStack(alignment: .top) {
                                Button {
                                    if button2[33] {
                                        button2[33] = false
                                    }
                                    else {
                                        button2[33] = true
                                    }
                                } label: {
                                    if button2[33] {
                                        Image(systemName: "checkmark.square")
                                    }
                                    else {
                                        Image(systemName: "square")
                                    }
                                }
                                Text("HIV/AIDS")
                            }.foregroundColor(.black)
                            HStack(alignment: .top) {
                                Button {
                                    if button2[34] {
                                        button2[34] = false
                                    }
                                    else {
                                        button2[34] = true
                                    }
                                } label: {
                                    if button2[34] {
                                        Image(systemName: "checkmark.square")
                                    }
                                    else {
                                        Image(systemName: "square")
                                    }
                                }
                                Text("Hypertension")
                            }.foregroundColor(.black)
                        }
                        VStack(alignment: .leading, spacing: 3) {
                            HStack(alignment: .top) {
                                Button {
                                    if button2[35] {
                                        button2[35] = false
                                    }
                                    else {
                                        button2[35] = true
                                    }
                                } label: {
                                    if button2[35] {
                                        Image(systemName: "checkmark.square")
                                    }
                                    else {
                                        Image(systemName: "square")
                                    }
                                }
                                Text("Hypothyroidism")
                            }.foregroundColor(.black)
                            HStack(alignment: .top) {
                                Button {
                                    if button2[36] {
                                        button2[36] = false
                                    }
                                    else {
                                        button2[36] = true
                                    }
                                } label: {
                                    if button2[36] {
                                        Image(systemName: "checkmark.square")
                                    }
                                    else {
                                        Image(systemName: "square")
                                    }
                                }
                                Text("IBS")
                            }.foregroundColor(.black)
                            HStack(alignment: .top) {
                                Button {
                                    if button2[37] {
                                        button2[37] = false
                                    }
                                    else {
                                        button2[37] = true
                                    }
                                } label: {
                                    if button2[37] {
                                        Image(systemName: "checkmark.square")
                                    }
                                    else {
                                        Image(systemName: "square")
                                    }
                                }
                                Text("Joint pain")
                            }.foregroundColor(.black)
                            HStack(alignment: .top) {
                                Button {
                                    if button2[38] {
                                        button2[38] = false
                                    }
                                    else {
                                        button2[38] = true
                                    }
                                } label: {
                                    if button2[38] {
                                        Image(systemName: "checkmark.square")
                                    }
                                    else {
                                        Image(systemName: "square")
                                    }
                                }
                                Text("Lymphedema")
                            }.foregroundColor(.black)
                            HStack(alignment: .top) {
                                Button {
                                    if button2[39] {
                                        button2[39] = false
                                    }
                                    else {
                                        button2[39] = true
                                    }
                                } label: {
                                    if button2[39] {
                                        Image(systemName: "checkmark.square")
                                    }
                                    else {
                                        Image(systemName: "square")
                                    }
                                }
                                Text("Migraine headaches")
                            }.foregroundColor(.black)
                            HStack(alignment: .top) {
                                Button {
                                    if button2[40] {
                                        button2[40] = false
                                    }
                                    else {
                                        button2[40] = true
                                    }
                                } label: {
                                    if button2[40] {
                                        Image(systemName: "checkmark.square")
                                    }
                                    else {
                                        Image(systemName: "square")
                                    }
                                }
                                Text("MRSA")
                            }.foregroundColor(.black)
                            HStack(alignment: .top) {
                                Button {
                                    if button2[41] {
                                        button2[41] = false
                                    }
                                    else {
                                        button2[41] = true
                                    }
                                } label: {
                                    if button2[41] {
                                        Image(systemName: "checkmark.square")
                                    }
                                    else {
                                        Image(systemName: "square")
                                    }
                                }
                                Text("Multiple Sclerosis")
                            }.foregroundColor(.black)
                        }

                    }.fixedSize(horizontal: false, vertical: true)
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading, spacing: 3) {
                            HStack(alignment: .top) {
                                Button {
                                    if button2[42] {
                                        button2[42] = false
                                    }
                                    else {
                                        button2[42] = true
                                    }
                                } label: {
                                    if button2[42] {
                                        Image(systemName: "checkmark.square")
                                    }
                                    else {
                                        Image(systemName: "square")
                                    }
                                }
                                Text("MI(heart attack)")
                            }.foregroundColor(.black)
                            HStack(alignment: .top) {
                                Button {
                                    if button2[43] {
                                        button2[43] = false
                                    }
                                    else {
                                        button2[43] = true
                                    }
                                } label: {
                                    if button2[43] {
                                        Image(systemName: "checkmark.square")
                                    }
                                    else {
                                        Image(systemName: "square")
                                    }
                                }
                                Text("Osteoarthritis")
                            }.foregroundColor(.black)
                            HStack(alignment: .top) {
                                Button {
                                    if button2[44] {
                                        button2[44] = false
                                    }
                                    else {
                                        button2[44] = true
                                    }
                                } label: {
                                    if button2[44] {
                                        Image(systemName: "checkmark.square")
                                    }
                                    else {
                                        Image(systemName: "square")
                                    }
                                }
                                Text("Osteoporosis")
                            }.foregroundColor(.black)
                            HStack(alignment: .top) {
                                Button {
                                    if button2[45] {
                                        button2[45] = false
                                    }
                                    else {
                                        button2[45] = true
                                    }
                                } label: {
                                    if button2[45] {
                                        Image(systemName: "checkmark.square")
                                    }
                                    else {
                                        Image(systemName: "square")
                                    }
                                }
                                Text("Peripheral Neuropathy")
                            }.foregroundColor(.black)
                            HStack(alignment: .top) {
                                Button {
                                    if button2[46] {
                                        button2[46] = false
                                    }
                                    else {
                                        button2[46] = true
                                    }
                                } label: {
                                    if button2[46] {
                                        Image(systemName: "checkmark.square")
                                    }
                                    else {
                                        Image(systemName: "square")
                                    }
                                }
                                Text("Psoriatic Arthritis")
                            }.foregroundColor(.black)
                            HStack(alignment: .top) {
                                Button {
                                    if button2[47] {
                                        button2[47] = false
                                    }
                                    else {
                                        button2[47] = true
                                    }
                                } label: {
                                    if button2[47] {
                                        Image(systemName: "checkmark.square")
                                    }
                                    else {
                                        Image(systemName: "square")
                                    }
                                }
                                Text("PVD(Peripheral Vascular Disease")
                            }.foregroundColor(.black)
                            HStack(alignment: .top) {
                                Button {
                                    if button2[48] {
                                        button2[48] = false
                                    }
                                    else {
                                        button2[48] = true
                                    }
                                } label: {
                                    if button2[48] {
                                        Image(systemName: "checkmark.square")
                                    }
                                    else {
                                        Image(systemName: "square")
                                    }
                                }
                                Text("Rheumatoid Arthritis")
                            }.foregroundColor(.black)
                        }
                        VStack(alignment: .leading, spacing: 3) {
                            HStack(alignment: .top) {
                                Button {
                                    if button2[49] {
                                        button2[49] = false
                                    }
                                    else {
                                        button2[49] = true
                                    }
                                } label: {
                                    if button2[49] {
                                        Image(systemName: "checkmark.square")
                                    }
                                    else {
                                        Image(systemName: "square")
                                    }
                                }
                                Text("Scoliosis")
                            }.foregroundColor(.black)
                            HStack(alignment: .top) {
                                Button {
                                    if button2[50] {
                                        button2[50] = false
                                    }
                                    else {
                                        button2[50] = true
                                    }
                                } label: {
                                    if button2[50] {
                                        Image(systemName: "checkmark.square")
                                    }
                                    else {
                                        Image(systemName: "square")
                                    }
                                }
                                Text("Seizure Disorder")
                            }.foregroundColor(.black)
                            HStack(alignment: .top) {
                                Button {
                                    if button2[51] {
                                        button2[51] = false
                                    }
                                    else {
                                        button2[51] = true
                                    }
                                } label: {
                                    if button2[51] {
                                        Image(systemName: "checkmark.square")
                                    }
                                    else {
                                        Image(systemName: "square")
                                    }
                                }
                                Text("Shortness of breath")
                            }.foregroundColor(.black)
                            HStack(alignment: .top) {
                                Button {
                                    if button2[52] {
                                        button2[52] = false
                                    }
                                    else {
                                        button2[52] = true
                                    }
                                } label: {
                                    if button2[52] {
                                        Image(systemName: "checkmark.square")
                                    }
                                    else {
                                        Image(systemName: "square")
                                    }
                                }
                                Text("Sleeping disorder")
                            }.foregroundColor(.black)
                            HStack(alignment: .top) {
                                Button {
                                    if button2[53] {
                                        button2[53] = false
                                    }
                                    else {
                                        button2[53] = true
                                    }
                                } label: {
                                    if button2[53] {
                                        Image(systemName: "checkmark.square")
                                    }
                                    else {
                                        Image(systemName: "square")
                                    }
                                }
                                Text("TB(Tuberculosis")
                            }.foregroundColor(.black)
                            HStack(alignment: .top) {
                                Button {
                                    if button2[54] {
                                        button2[54] = false
                                    }
                                    else {
                                        button2[54] = true
                                    }
                                } label: {
                                    if button2[54] {
                                        Image(systemName: "checkmark.square")
                                    }
                                    else {
                                        Image(systemName: "square")
                                    }
                                }
                                Text("Urinary Incontinence")
                            }.foregroundColor(.black)
                        }
                    }.fixedSize(horizontal: false, vertical: true)
                }.padding(.top)
                VStack(alignment: .leading) {
                    HStack(alignment: .top) {
                        Button {
                            if button2[55] {
                                button2[55] = false
                            }
                            else {
                                for index in (0..<button2.count) {
                                    button2[index] = false
                                }
                                button2[55] = true
                            }
                        } label: {
                            if button2[55] {
                                Image(systemName: "checkmark.square")
                                    .font(.headline)

                            }
                            else {
                                Image(systemName: "square")
                                    .font(.headline)

                            }
                        }
                        Text("None of the above")
                            .font(.headline)
                    }.foregroundColor(.black).padding(.top, 10)
                    Text("Other conditions not listed:")
                        .padding(.top, 10)
                        .font(.headline)
                    TextField("Conditions", text: $otherConditions)
                        .accentColor(.black)
                        .textFieldStyle(.roundedBorder)
                        .padding(.bottom, 5)
                        .frame(width: 350)
                    Divider().padding(.vertical)
                    
                }
                HStack(alignment: .top, spacing: 40) {
                    VStack(alignment: .leading) {
                        Text("Please list all medications you are currently taking(including dose and frequency, if possible):")
                            .font(Font.title3.weight(.bold))
                            .fixedSize(horizontal: false, vertical: true)
                        TextEditor(text: $medicationsList)
                            .foregroundColor(medicationsList == "List" ? Color.gray.opacity(0.5) : .black)
                            .frame(width: 350, height: 75)
                            .border(Color.init(.sRGB, red: 0.92941, green: 0.92941, blue: 0.92941, opacity: 1), width: 1)
                            .padding(.bottom)
                            .onTapGesture {
                                if medicationsList == "List" {
                                    medicationsList = ""
                                }
                            }
                        Text("Occupation: ")
                            .font(Font.title3.weight(.bold))
                        TextField("Text here", text: $occupation)
                            .accentColor(.black)
                            .textFieldStyle(.roundedBorder)
                            .frame(width: 350)
                            .padding(.bottom)
                        Text("If employed, current ability to work: ")
                            .font(Font.title3.weight(.bold))
                            .padding(.bottom, 5)
                        VStack(alignment: .leading) {
                            Button {
                                if button3[0] == false {
                                    button3[0] = true
                                    button3[1] = false
                                    button3[2] = false
                                }
                            } label: {
                                HStack {
                                    if button3[0] == false {
                                        Image(systemName: "square")
                                            .foregroundColor(.black)
                                    }
                                    else {
                                        Image(systemName: "checkmark.square")
                                            .foregroundColor(.black)
                                    }
                                    Text("Able to perform all duties/No restrictions")
                                        .foregroundColor(.black)
                                }
                            }
                            Button {
                                if button3[1] == false {
                                    button3[1] = true
                                    button3[0] = false
                                    button3[2] = false
                                }
                            } label: {
                                HStack {
                                    if button3[1] == false {
                                        Image(systemName: "square")
                                            .foregroundColor(.black)
                                    }
                                    else {
                                        Image(systemName: "checkmark.square")
                                            .foregroundColor(.black)
                                    }
                                    Text("Restricted duties/schedule")
                                        .foregroundColor(.black)
                                }
                            }
                            Button {
                                if button3[2] == false {
                                    button3[2] = true
                                    button3[0] = false
                                    button3[1] = false
                                }
                            } label: {
                                HStack {
                                    if button3[2] == false {
                                        Image(systemName: "square")
                                            .foregroundColor(.black)
                                    }
                                    else {
                                        Image(systemName: "checkmark.square")
                                            .foregroundColor(.black)
                                    }
                                    Text("Off work, temporary disability")
                                        .foregroundColor(.black)
                                }
                            }
                            Text("Please outline any restrictions, if any:")
                                .font(Font.headline)
                                .padding(.top)
                            TextField("Restrictions", text: $workRestrictions)
                                .accentColor(.black)
                                .textFieldStyle(.roundedBorder)
                                .frame(width: 350)
                                .padding(.bottom)

                        }
                        
                    }
                    VStack(alignment: .leading) {
                        Text("Please describe any work duties you are currently unable to perform?(i.e. sitting for extended periods, standing for extended periods, repetitive lifting, etc.")
                            .font(Font.title3.weight(.bold))
                            .fixedSize(horizontal: false, vertical: true)
                        TextEditor(text: $workDuties)
                            .foregroundColor(workDuties == "Duties" ? Color.gray.opacity(0.5) : .black)
                            .frame(width: 350, height: 75)
                            .border(Color.init(.sRGB, red: 0.92941, green: 0.92941, blue: 0.92941, opacity: 1), width: 1)
                            .padding(.bottom)
                            .onTapGesture {
                                if workDuties == "Duties" {
                                    workDuties = ""
                                }
                            }
                        Text("Have you fallen in the last 12 months?")
                            .font(Font.title3.weight(.bold))
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.bottom, 5)
                        HStack {
                            Button {
                                if button4[0] == false {
                                    button4[0] = true
                                    button4[1] = false
                                }
                            } label: {
                                HStack {
                                    if button4[0] == false {
                                        Image(systemName: "square")
                                    }
                                    else {
                                        Image(systemName: "checkmark.square")
                                    }
                                    Text("Yes")
                                        .padding(.leading, 5)
                                }.foregroundColor(.black)
                            }.padding(.trailing)
                            Button {
                                if button4[1] == false {
                                    button4[1] = true
                                    button4[0] = false
                                }
                            } label: {
                                HStack {
                                    if button4[1] == false {
                                        Image(systemName: "square")
                                    }
                                    else {
                                        Image(systemName: "checkmark.square")
                                    }
                                    Text("No")
                                        .padding(.leading, 5)
                                }.foregroundColor(.black)
                            }

                        }.padding(.bottom, 5)
                        if button4[0] == true {
                            VStack(alignment: .leading) {
                                Text("How many times?")
                                TextField("Number of falls", text: $timesFallen)
                                    .accentColor(.black)
                                    .textFieldStyle(.roundedBorder)
                                    .padding(.bottom, 5)
                                    .frame(width: 350)
                                Text("Reason for fall(s)?")
                                TextField("Reason", text: $reasonFall)
                                    .accentColor(.black)
                                    .textFieldStyle(.roundedBorder)
                                    .padding(.bottom, 5)
                                    .frame(width: 350)
                                Text("Did any falls result in injury?")
                                    .padding(.bottom, 5)
                                HStack {
                                    Button {
                                        if button5[0] == false {
                                            button5[0] = true
                                            button5[1] = false
                                        }
                                    } label: {
                                        HStack {
                                            if button5[0] == false {
                                                Image(systemName: "square")
                                            }
                                            else {
                                                Image(systemName: "checkmark.square")
                                            }
                                            Text("Yes")
                                                .padding(.leading, 5)
                                        }.foregroundColor(.black)
                                    }
                                    Button {
                                        if button5[1] == false {
                                            button5[1] = true
                                            button5[0] = false
                                        }
                                    } label: {
                                        HStack {
                                            if button5[1] == false {
                                                Image(systemName: "square")
                                            }
                                            else {
                                                Image(systemName: "checkmark.square")
                                            }
                                            Text("No")
                                                .padding(.leading, 5)
                                        }.foregroundColor(.black)
                                    }

                                }
                            }
                        }
                    }
                }
            }.padding()
        }
        .accentColor(.blue)
        .frame(width: UIScreen.main.bounds.width)
    }
    var privacyView: some View {
        ZStack {
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
            }.padding()
        }.frame(width: UIScreen.main.bounds.width)
    }
    var needleView: some View {
        ZStack {
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
        }.frame(width: UIScreen.main.bounds.width)
    }
    var insuranceView: some View {
        ZStack {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text("Insurance Information")
                        .bold()
                        .font(.largeTitle)
                        .padding(.bottom, 30)
                    HStack(alignment: .top, spacing: 20) {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Name of Patient or Legal Guardian(if patient is a minor):")
                            TextField("Name", text: $patientNameInsurance)
                                .accentColor(.black)
                                .textFieldStyle(.roundedBorder)
                                .padding(.bottom, 5)
                            Text("Name of Primary Insurance Carrier:")
                            TextField("Insurance Name", text: $InsuranceNameInsurance[0])
                                .accentColor(.black)
                                .textFieldStyle(.roundedBorder)
                                .padding(.bottom, 5)
                            Text("Member ID:")
                            TextField("ID number", text: $memberIdInsurance[0])
                                .padding(.bottom, 5)
                                .accentColor(.black)
                                .textFieldStyle(.roundedBorder)
                            Text("Group Number:")
                            TextField("Number", text: $groupNumberInsurance[0])
                                .padding(.bottom, 5)
                                .accentColor(.black)
                                .textFieldStyle(.roundedBorder)
                        }
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Name of Secondary Insurance Carrier (if applicable):")
                            TextField("Secondary Insurance Name", text: $InsuranceNameInsurance[1])
                                .padding(.bottom, 5)
                                .accentColor(.black)
                                .textFieldStyle(.roundedBorder)
                            Text("Member ID:")
                            TextField("ID number", text: $memberIdInsurance[1])
                                .padding(.bottom, 5)
                                .accentColor(.black)
                                .textFieldStyle(.roundedBorder)
                            Text("Group Number:")
                            TextField("Number", text: $groupNumberInsurance[1])
                                .padding(.bottom, 5)
                                .accentColor(.black)
                                .textFieldStyle(.roundedBorder)
                        }
                    }
                }
                VStack(alignment: .leading) {
                    Text("Patient Financial Responsibility form:")
                        .bold()
                        .font(.title2)
                        .padding(.top, 20)
                    Text("Agreement: \(model.clinicName) would like to be as transparent as possible in regard to fees for services and responsibilities. Because we recognize the need for a clear understanding between patient and medical provider regarding financial arrangements for healthcare, the following information is provided to avoid any misunderstanding concerning protected health information and payment for professional services.")
                        .fixedSize(horizontal: false, vertical: true)

                    Text("Insurance Patient Financial Responsibility Form - Consents")
                        .bold()
                        .font(.title2)
                        .padding(.top, 10)
                    Text("Please check the box to indicate that you understand the following:")
                        .bold()
                        .padding(.vertical)
                        .font(.title3)
                    HStack(alignment: .top) {
                        Button {
                            if buttonInsurance[0] == false {
                                buttonInsurance[0] = true
                            }
                            else {
                                buttonInsurance[0] = false
                            }
                        } label: {
                            if buttonInsurance[0] == true {
                                Image(systemName: "checkmark.square")
                                    .font(Font.title2)
                                    .foregroundColor(.black)
                            }
                            else {
                                Image(systemName: "square")
                                    .font(Font.title2)
                                    .foregroundColor(.black)
                            }
                        }
                        Text("As a courtesy, we bill your insurance carrier. However, it must be understood that the contract is between you and your insurance carrier and you are fully responsible for any amount that they do not pay.")
                        .fixedSize(horizontal: false, vertical: true)
                    }.padding(.bottom, 10)
                    HStack(alignment: .top) {
                        Button {
                            if buttonInsurance[1] == false {
                                buttonInsurance[1] = true
                            }
                            else {
                                buttonInsurance[1] = false
                            }
                        } label: {
                            if buttonInsurance[1] == true {
                                Image(systemName: "checkmark.square")
                                    .font(Font.title2)
                                    .foregroundColor(.black)
                            }
                            else {
                                Image(systemName: "square")
                                    .font(Font.title2)
                                    .foregroundColor(.black)
                            }
                        }
                        Text("Our office does not guarantee that your insurance will pay. Some insurance companies do not cover certain treatments. We will assist you in making every attempt to receive verification of your policy. If your claim is denied for any reason, you are responsible for the full amount of your bill.")
                            .fixedSize(horizontal: false, vertical: true)
                    }.padding(.bottom, 10)
                    HStack(alignment: .top) {
                        Button {
                            if buttonInsurance[2] == false {
                                buttonInsurance[2] = true
                            }
                            else {
                                buttonInsurance[2] = false
                            }
                        } label: {
                            if buttonInsurance[2] == true {
                                Image(systemName: "checkmark.square")
                                    .font(Font.title2)
                                    .foregroundColor(.black)
                            }
                            else {
                                Image(systemName: "square")
                                    .font(Font.title2)
                                    .foregroundColor(.black)
                            }
                        }
                        Text("Our office will not enter into a dispute with your insurance company over any unpaid claim.")
                    }.padding(.bottom, 10)
                    HStack(alignment: .top) {
                        Button {
                            if buttonInsurance[3] == false {
                                buttonInsurance[3] = true
                            }
                            else {
                                buttonInsurance[3] = false
                            }
                        } label: {
                            if buttonInsurance[3] == true {
                                Image(systemName: "checkmark.square")
                                    .font(Font.title2)
                                    .foregroundColor(.black)
                            }
                            else {
                                Image(systemName: "square")
                                    .font(Font.title2)
                                    .foregroundColor(.black)
                            }
                        }
                        Text("PAYMENT: Even though insurance will be billed, you are responsible for any balance after insurance processes your claim. All charges for treatment become due and payable sixty (60) days after the date of service. These periods allow sufficient time to process insurance and make payment in full of any remaining balance.")
                            .fixedSize(horizontal: false, vertical: true)
                    }.padding(.bottom, 10)
                }
                VStack(alignment: .leading) {
                    Text("Insurance Payment Agreement:")
                        .bold()
                        .font(.title2)
                        .padding(.top, 10)
                    Text("I understand that I am financially responsible for my health insurance deductible, coinsurance, or non-covered service. Copayments are due at time of service. In the event that my health plan determines a service to be “not payable”, I will be responsible for the complete charge and agree to pay the costs of all services provided. In the event that my insurer does not pay all of the medical charges incurred, I hereby authorize \(model.clinicName) to automatically charge the credit or debit card on my account for the remaining balance due.")
                        .fixedSize(horizontal: false, vertical: true)

                    Text("Insurance Authorization for Assigment of Benefits:")
                        .bold()
                        .font(.title2)
                        .padding(.top, 10)
                    Text("I hereby authorize and direct payment of my medical benefits to \(model.clinicName) on my behalf for any services furnished to me by the providers.")
                        .fixedSize(horizontal: false, vertical: true)
                    Text("Authorization to Release Records:")
                        .bold()
                        .font(.title2)
                        .padding(.top, 10)
                    Text("I hereby authorize \(model.clinicName) to release to my insurer, governmental agencies, or any other entity financially responsible for my medical care, all information, including diagnosis and the records of any treatment or examination rendered to me needed to substantiate payment for such medical services as well as information required for pre-certification, authorization or referral to other medical provider")
                        .fixedSize(horizontal: false, vertical: true)
                    Text("I have read and understand these policies and my responsibility concerning the payment of these services")
                        .bold()
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.title3)
                        .padding(.vertical, 10)
                    if signatureInsurance == "" {
                        Text("Signature of patient or legal guardian:")
                            .foregroundColor(.red)
                    }
                    else {
                        Text("Signature of patient or legal guardian:")
                            .foregroundColor(.black)
                    }
                    HStack {
                        TextField("Signature", text: $signatureInsurance)
                            .padding(.bottom, 5)
                            .accentColor(.black)
                            .textFieldStyle(.roundedBorder)
                            .frame(width: 300)
                        Text("Date: ")
                            .padding(.leading)
                        Text(Date().addingTimeInterval(600), style: .date)
                                .padding(.leading)
                        
                    }
                }
            }.padding()
        }.frame(width: UIScreen.main.bounds.width)
    }
    var infoView: some View {
        ZStack {
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
                            TextField("Name", text: $ContactNameInfo)
                                .padding(.leading, 20)
                                .accentColor(.black)
                                .textFieldStyle(.roundedBorder)
                            TextField("Phone Number", text: $ContactPhoneNumberInfo)
                                .padding(.leading, 20)
                                .accentColor(.black)
                                .textFieldStyle(.roundedBorder)
                            TextField("Relationship", text: $ContactRelationInfo)
                                .padding(.leading, 20)
                                .accentColor(.black)
                                .textFieldStyle(.roundedBorder)
                            TextField("Email address", text: $EmailAddressInfo)
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
                            Text("2. Cancel/No Show Policy: Please call our office if you cannot come to an appointment already scheduled. 24-hour advance notice is required for changes to your appointment. Giving less than 24-hour notice of appointment changes will result in a $\(model.cancelFee) LATE CANCEL fee added to your account. Failure to call or show for an appointment will result in a $\(model.noShowFee) NO-SHOW fee added to your account.")
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
                            Text("Date: ")
                                .padding(.leading)
                            Text(Date().addingTimeInterval(600), style: .date)
                                    .padding(.leading)
                            
                        
                    }.padding(.bottom)
                }.padding(.horizontal).padding(.bottom)
            }
        }.frame(width: UIScreen.main.bounds.width)
    }
    var lefsView: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text(survey.description)
                    .font(.headline)
                    .padding(.bottom, 10)
                if survey.language == "English" {
                    Text("The following scale applies to every question:")
                        .font(.headline)
                        .bold()
                        .padding(.bottom, 5)
                        
                }
                else {
                    Text("El siguiente escala aplica a cada pregunta:")
                        .font(.headline)
                        .bold()
                        .padding(.bottom, 5)
                }
                ForEach(0..<survey.questions[0].rating.count) { index in
                    Text(survey.questions[0].rating[index])
                        .font(.subheadline)
                        .padding(.bottom, 1)
                        .padding(.leading, 20)
                }
                Divider()
                ForEach(0..<survey.questions.count) { index in
                    VStack(alignment: .leading) {
                        Text("\(survey.questions[index].title)")
                            .font(.headline)
                            .padding(.bottom, 5)
                        Picker("", selection: $model.selectedValue[index]) {
                            ForEach(0..<5) { ratingIndex in
                                Text(String(ratingIndex)).tag(ratingIndex)
                            }
                        }.pickerStyle(SegmentedPickerStyle())
                            .onChange(of: model.selectedValue) { newValue in
                                model.finishedSurvey = false
                                model.score = 0
                                for index in 0..<model.selectedValue.count {
                                    model.score += model.selectedValue[index]
                                }
                                model.PDFimage.removeAll()
                            }
                        
                    }.padding(.bottom, 40).padding(.top, 10)
                }
                HStack {
                    Spacer()
                    Text("Score: \(model.score)/80")
                        .font(.title)
                    .padding()
                }
            }.padding()
        }.frame(width: UIScreen.main.bounds.width)
    }
    var backIndexView: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text(survey.description)
                    .font(.headline)
                    .padding(.bottom, 10)
                Divider()
                ForEach(0..<survey.questions.count) { index in
                    Text("\(survey.questions[index].title)")
                        .font(.title)
                    Picker("", selection: $model.selectedValue[index]) {
                        ForEach(0..<survey.questions[index].rating.count) { ratingIndex in
                            Text(String(ratingIndex)).tag(ratingIndex)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                        .onChange(of: model.selectedValue) { newValue in
                            model.finishedSurvey = false
                            model.score = 0
                            for index in 0..<model.selectedValue.count {
                                model.score += model.selectedValue[index]
                            }
                            model.PDFimage.removeAll()
                        }
                    ForEach(0..<survey.questions[index].rating.count) { ratingIndex in
                        Text(survey.questions[index].rating[ratingIndex]).tag(ratingIndex)
                    }.padding(.leading, 10)
                    Divider().padding(.bottom)
                }
                
                HStack {
                    Spacer()
                    Text("Score: \(Int(Double(model.score*100/50)))%")
                        .font(.title)
                        .padding()
                }
            }.padding()
        }.frame(width: UIScreen.main.bounds.width)
    }
    var quickDashEngView: some View {
        ZStack {
            VStack {
                Text(survey.description)
                    .font(.headline)
                    .padding(.bottom, 10)
                Divider()
                VStack(alignment: .leading) {
                    HStack {
                        Spacer()
                        HStack(spacing: 15) {
                            VStack {
                                Text("No")
                                Text("difficulty")
                            }
                            VStack {
                                Text("Mild")
                                Text("difficulty")
                            }
                            VStack {
                                Text("Moderate")
                                Text("difficulty")
                            }
                            VStack {
                                Text("Severe")
                                Text("difficulty")
                            }
                            VStack {
                                Text("Unable")
                                Text("to do")
                            }
                        }.frame(width: 410)
                    }
                    ForEach(0..<6) { index in
                        VStack(alignment: .leading) {
                            HStack {
                                Text("\(index+1). \(survey.questions[index].title)")
                                    .fixedSize(horizontal: false, vertical: true)
                                Spacer()
                                
                                VStack {
                                    Picker("", selection: $model.selectedValue[index]) {
                                        ForEach(0..<survey.questions[index].rating.count) { ratingIndex in
                                            Text(String(ratingIndex+1)).tag(ratingIndex)
                                        }
                                    }.pickerStyle(SegmentedPickerStyle())
                                        .frame(width: 410)
                                        .onChange(of: model.selectedValue) { newValue in
                                            model.finishedSurvey = false
                                            model.score = 0
                                            for index in 0..<model.selectedValue.count {
                                                model.score += model.selectedValue[index]
                                            }
                                            model.PDFimage.removeAll()
                                        }
                                    Spacer()
                                }
                                
                            }
                        }.padding(.bottom, 10)
                    }
                    Divider()
                        .foregroundColor(.black)
                    HStack {
                        Spacer()
                        HStack {
                            VStack {
                                Text("Not at all")
                            }
                            VStack {
                                Text("Slightly")
                            }
                            VStack {
                                Text("Moderately")
                            }
                            VStack {
                                Text("Quite a bit")
                            }
                            VStack {
                                Text("Extremely")
                            }
                        }.frame(width: 410)
                            .padding(.bottom, 10)
                    }
                    HStack {
                        Text("\(7). \(survey.questions[6].title)")
                            .padding(.leading, 5)
                            .fixedSize(horizontal: false, vertical: true)
                        Spacer()
                        
                        VStack {
                            Picker("", selection: $model.selectedValue[6]) {
                                ForEach(0..<survey.questions[0].rating.count) { ratingIndex in
                                    Text(String(ratingIndex+1)).tag(ratingIndex)
                                }
                            }.pickerStyle(SegmentedPickerStyle())
                                .frame(width: 400)
                            Spacer()
                        }
                    }
                    Divider()
                        .foregroundColor(.black)
                    HStack {
                        Spacer()
                        HStack {
                            VStack {
                                Text("Not limited")
                                Text("at all")
                            }
                            VStack {
                                Text("Slightly")
                                Text("limited")
                            }
                            VStack {
                                Text("Moderately")
                                Text("limited")
                            }
                            VStack {
                                Text("Very")
                                Text("limited")
                            }
                            VStack {
                                Text("Unable")
                                Text("to do")
                            }
                        }.frame(width: 410)
                            .padding(.vertical, 10)
                    }
                    HStack {
                        Text("\(8). \(survey.questions[7].title)")
                            .padding(.leading, 5)
                            .fixedSize(horizontal: false, vertical: true)
                        Spacer()
                        
                        VStack {
                            Picker("", selection: $model.selectedValue[7]) {
                                ForEach(0..<survey.questions[0].rating.count) { ratingIndex in
                                    Text(String(ratingIndex+1)).tag(ratingIndex)
                                }
                            }.pickerStyle(SegmentedPickerStyle())
                                .frame(width: 400)
                            Spacer()
                        }
                    }
                    Divider()
                        .foregroundColor(.black)
                }
                VStack(alignment: .leading) {
                    Text("Please rate the severity of the following symptoms in the last week:")
                        .bold()
                        .padding(.vertical, 20)
                    
                    HStack {
                        Spacer()
                        HStack {
                            Text("None").padding(.leading, 20)
                            Text("Mild").padding(.trailing, 10).padding(.leading, 30)
                            Text("Moderate").padding(.trailing, 20).padding(.leading, 10)
                            Text("Severe").padding(.trailing, 10)
                            Text("Extreme")
                        }.frame(width: 410)
                            .padding(.bottom, 10)
                    }
                    HStack {
                        Text("\(9). \(survey.questions[8].title)")
                            .padding(.leading, 5)
                        Spacer()
                        
                        VStack {
                            Picker("", selection: $model.selectedValue[8]) {
                                ForEach(0..<survey.questions[0].rating.count) { ratingIndex in
                                    Text(String(ratingIndex+1)).tag(ratingIndex)
                                }
                            }.pickerStyle(SegmentedPickerStyle())
                                .frame(width: 400)
                            
                        }
                    }.padding(.bottom, 20)
                    HStack {
                        Text("\(10). \(survey.questions[9].title)")
                            .padding(.leading, 5)
                        Spacer()
                        
                        VStack {
                            Picker("", selection: $model.selectedValue[9]) {
                                ForEach(0..<survey.questions[0].rating.count) { ratingIndex in
                                    Text(String(ratingIndex+1)).tag(ratingIndex)
                                }
                            }.pickerStyle(SegmentedPickerStyle())
                                .frame(width: 400)
                                .padding(.bottom, 20)
                        }
                    }
                    Divider()
                    HStack {
                        Spacer()
                        HStack {
                            VStack {
                                Text("No")
                                Text("difficulty")
                            }
                            VStack {
                                Text("Mild")
                                Text("difficulty")
                            }
                            VStack {
                                Text("Moderate")
                                Text("difficulty")
                            }
                            VStack {
                                Text("Severe")
                                Text("difficulty")
                            }
                            VStack {
                                Text("So much it")
                                Text("prevents")
                                Text("sleep")
                            }
                        }.frame(width: 410)
                            .padding(.vertical, 10)
                    }
                    HStack {
                        Text("\(11). \(survey.questions[10].title)")
                            .padding(.leading, 5)
                            .fixedSize(horizontal: false, vertical: true)
                        Spacer()
                        
                        VStack {
                            Picker("", selection: $model.selectedValue[10]) {
                                ForEach(0..<survey.questions[0].rating.count) { ratingIndex in
                                    Text(String(ratingIndex+1)).tag(ratingIndex)
                                }
                            }.pickerStyle(SegmentedPickerStyle())
                                .frame(width: 400)
                                .padding(.bottom, 50)
                        }
                    }
                    HStack {
                        Spacer()
                        Text("Score: \(model.score)/55")
                            .bold()
                            .font(.title)
                            .padding()
                    }
                    .padding(.vertical, 5)
                }
            }.padding()
        }.frame(width: UIScreen.main.bounds.width)

    }
    
    var body: some View {
        ZStack {
            BackgroundView()
            Rectangle()
                .foregroundColor(Color.init(.sRGB, red: 0.92941, green: 0.92941, blue: 0.92941, opacity: 1))
                .cornerRadius(5)
                .shadow(radius: 5)
                .padding(.top)
            if model.selectedValue == [Int]() {
                ProgressView()
            }
            else {
                    VStack(alignment: .leading) {
                            ScrollView {
                                LazyVStack(alignment: .leading, spacing: 30) {
                                    if model.eval == true {
                                        if model.showMedicalHistory == true && model.includeMedicalHistory == true {
                                            ZStack {
                                                Rectangle()
                                                    .foregroundColor(.white)
                                                    .cornerRadius(5)
                                                    .shadow(radius: 5)
                                                medView
                                            }.onTapGesture {
                                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                            }
                                        }
                                        if model.showInsuranceIntake == true && model.includeInsuranceIntake == true {
                                            ZStack {
                                                Rectangle()
                                                    .foregroundColor(.white)
                                                    .cornerRadius(5)
                                                    .shadow(radius: 5)
                                                insuranceView
                                            }.onTapGesture {
                                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                            }
                                        }
                                        if model.showInfoAndPolicies == true && model.includeInformationAndPolicies == true {
                                            ZStack {
                                                Rectangle()
                                                    .foregroundColor(.white)
                                                    .cornerRadius(5)
                                                    .shadow(radius: 5)
                                                infoView
                                            }.onTapGesture {
                                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                            }
                                        }
                                        if model.showPrivacyPolicy == true && model.includePrivacyPolicy == true {
                                            ZStack {
                                                Rectangle()
                                                    .foregroundColor(.white)
                                                    .cornerRadius(5)
                                                    .shadow(radius: 5)
                                                privacyView
                                            }.onTapGesture {
                                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                            }
                                        }
                                        if model.showDryNeedling == true && model.includeDryNeedlingConsent == true {
                                            ZStack {
                                                Rectangle()
                                                    .foregroundColor(.white)
                                                    .cornerRadius(5)
                                                    .shadow(radius: 5)
                                                needleView
                                            }.onTapGesture {
                                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                            }
                                        }                                        
                                    }
                                    if survey.name == "LEFS" {
                                        ZStack {
                                            Rectangle()
                                                .foregroundColor(.white)
                                                .cornerRadius(5)
                                                .shadow(radius: 5)
                                            lefsView
                                        }
                                    }
                                    else if survey.name == "Back Index" {
                                        ZStack {
                                            Rectangle()
                                                .foregroundColor(.white)
                                                .cornerRadius(5)
                                                .shadow(radius: 5)
                                            backIndexView
                                        }
                                    }
                                    else if survey.name == "QuickDash" && survey.language == "English" {
                                        ZStack {
                                            Rectangle()
                                                .foregroundColor(.white)
                                                .cornerRadius(5)
                                                .shadow(radius: 5)
                                            quickDashEngView
                                        }
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
                                    Button {
                                        if model.eval == true {
                                            if model.showMedicalHistory == true && model.includeMedicalHistory == true {
                                                let image = medView.snapshot()
                                                model.PDFimage.append(image)
                                            }
                                            if model.showPrivacyPolicy == true && model.includePrivacyPolicy == true {
                                                let image = privacyView.snapshot()
                                                model.PDFimage.append(image)
                                            }
                                            if model.showDryNeedling == true && model.includeDryNeedlingConsent == true {
                                                let image = needleView.snapshot()
                                                model.PDFimage.append(image)
                                            }
                                            if model.showInsuranceIntake == true && model.includeInsuranceIntake == true {
                                                let image = insuranceView.snapshot()
                                                model.PDFimage.append(image)
                                            }
                                            if model.showInfoAndPolicies == true && model.includeInformationAndPolicies == true {
                                                let image = infoView.snapshot()
                                                model.PDFimage.append(image)
                                            }
                                        }
                                        if survey.name == "LEFS" {
                                            let image = lefsView.snapshot()
                                            model.PDFimage.append(image)
                                        }
                                        else if survey.name == "Back Index" {
                                            let image = backIndexView.snapshot()
                                            model.PDFimage.append(image)
                                        }
                                        else if survey.name == "QuickDash" && survey.language == "English" {
                                            let image = quickDashEngView.snapshot()
                                            model.PDFimage.append(image)
                                        }
                                        model.finishedSurvey = true
                                    } label: {
                                        ZStack {
                                            Rectangle()
                                                .foregroundColor(.green)
                                                .frame(width: UIScreen.main.bounds.width, height: 48)
                                                .cornerRadius(10)
                                                .shadow(radius: 1)
                                            Text("Finish")
                                                .foregroundColor(.white)
                                                .font(.title)
                                                .bold()
                                        }
                                    }.disabled(model.finishedSurvey ? true : false)
                                    NavigationLink {
                                        PDFViewer()
                                    } label: {
                                        Text("Get there")
                                    }

                                }
                            }.navigationBarTitleDisplayMode(.inline)
                            .toolbar {
                                ToolbarItem(placement: .principal) {
                                    Text("Intake Paperwork")
                                        .bold()
                                        .foregroundColor(.white)
                                        .font(.largeTitle)
                                }
                            }
                    }.frame(width: UIScreen.main.bounds.width-10)
                        .padding()
                
            }
        }.onAppear {
            model.selectedValue.removeAll()
            model.appendArray(survey.questions.count)
            model.finishedSurvey = false
        }
    }
    
}


