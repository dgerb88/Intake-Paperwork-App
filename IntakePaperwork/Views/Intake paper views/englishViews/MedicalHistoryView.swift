//
//  MedicalHistoryView.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 10/28/21.
//

import SwiftUI

struct MedicalHistoryView: View {
    
    @EnvironmentObject var model:SurveyModel
    var survey: Survey

    @State var primaryReason = ""
    @State var primaryReasonOther = ""
    @State var dateProblemStarted = ["", "", ""]
    @State private var button = [false, false, false, false, false, false, false, false, false, false, false]
    @State var button2 = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false]
    var famHistName = ["Fibromyalgia", "Frequent UTI", "GERD", "Glaucoma", "Gout", "Heart Disease", "Hepatitis B", "Hepatitis C", "Hiatal hernia", "High Cholesterol", "HIV/AIDS", "Hypertension", "Hypothyroidism", "IBS"]
    @State var diagnosticTesting = ""
    @State var secondReason = ""
    @State var historyCondition = "History"
    @State var dateSurgery = ["", "", ""]
    @State var typeSurgery = ""
    @State var dateNextDoc = ["", "", ""]
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
    @FocusState var keyboardChange: Bool
    @State var showAlert = false
    
    var medView: some View {
            VStack {
                VStack(alignment: .center) {
                    Text("Medical History")
                        .bold()
                        .font(.largeTitle)
                        .padding(.bottom, 30)
                }
                HStack(alignment: .top, spacing: 40) {
                    VStack(alignment: .leading) {
                        Group {
                            Text("Primary reason for visit:")
                                .font(Font.title3.weight(.bold))
                            TextField("Reason", text: $primaryReason)
                                .accentColor(.black)
                                .textFieldStyle(.roundedBorder)
                                .frame(width: 350)
                            Text("Date condition began:")
                                .font(Font.title3.weight(.bold))
                                .padding(.top)
                            HStack {
                                TextField("MM", text: $dateProblemStarted[0])
                                    .accentColor(.black)
                                    .textFieldStyle(.roundedBorder)
                                    .frame(width: 45)
                                    .keyboardType(.numberPad)
                                Text("/")
                                TextField("DD", text: $dateProblemStarted[1])
                                    .accentColor(.black)
                                    .textFieldStyle(.roundedBorder)
                                    .frame(width: 40)
                                    .keyboardType(.numberPad)
                                Text("/")
                                TextField("YYYY", text: $dateProblemStarted[2])
                                    .accentColor(.black)
                                    .textFieldStyle(.roundedBorder)
                                    .frame(width: 60)
                                    .keyboardType(.numberPad)
                            }
                        }
                        Group {
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
                        Group {
                            Text("Date of surgery (if applicable):")
                                .font(Font.title3.weight(.bold))
                                .padding(.top)
                            HStack {
                                TextField("MM", text: $dateSurgery[0])
                                    .accentColor(.black)
                                    .textFieldStyle(.roundedBorder)
                                    .frame(width: 45)
                                    .keyboardType(.numberPad)
                                Text("/")
                                TextField("DD", text: $dateSurgery[1])
                                    .accentColor(.black)
                                    .textFieldStyle(.roundedBorder)
                                    .frame(width: 40)
                                    .keyboardType(.numberPad)
                                Text("/")
                                TextField("YYYY", text: $dateSurgery[2])
                                    .accentColor(.black)
                                    .textFieldStyle(.roundedBorder)
                                    .frame(width: 60)
                                    .keyboardType(.numberPad)
                            }
                            if dateSurgery[0] != "" {
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
                            HStack {
                                TextField("MM", text: $dateNextDoc[0])
                                    .accentColor(.black)
                                    .textFieldStyle(.roundedBorder)
                                    .padding(.bottom, 5)
                                    .frame(width: 45)
                                    .keyboardType(.numberPad)
                                Text("/")
                                TextField("DD", text: $dateNextDoc[1])
                                    .accentColor(.black)
                                    .textFieldStyle(.roundedBorder)
                                    .padding(.bottom, 5)
                                    .frame(width: 40)
                                    .keyboardType(.numberPad)
                                Text("/")
                                TextField("YYYY", text: $dateNextDoc[2])
                                    .accentColor(.black)
                                    .textFieldStyle(.roundedBorder)
                                    .padding(.bottom, 5)
                                    .frame(width: 60)
                                    .keyboardType(.numberPad)
                            }
                        }
                        Group {
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
                        Group {
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
                        Group {
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
                    Text("Please mark any conditions you have a PERSONAL history of (not family history):")
                        .font(Font.title3.weight(.bold))
                        .fixedSize(horizontal: false, vertical: true)
                }
                HStack(alignment: .top, spacing: 30) {
                    VStack(alignment: .leading, spacing: 5) {
                        Group {
                            Button {
                                if button2[0] {
                                    button2[0] = false
                                }
                                else {
                                    button2[0] = true
                                }
                            } label: {
                                if button2[0] {
                                    HStack(alignment: .top) {
                                        Image(systemName: "checkmark.square")
                                        Text("Abnormal bleeding")
                                    }
                                }
                                else {
                                    HStack {
                                        Image(systemName: "square")
                                        Text("Abnormal bleeding")
                                    }
                                }
                            }
                                .foregroundColor(.black)
                            Button {
                                if button2[1] {
                                    button2[1] = false
                                }
                                else {
                                    button2[1] = true
                                }
                            } label: {
                                if button2[1] {
                                    HStack {
                                        Image(systemName: "checkmark.square")
                                        Text("Angina(chest pain)")
                                    }
                                }
                                else {
                                    HStack {
                                        Image(systemName: "square")
                                        Text("Angina(chest pain)")
                                    }
                                }
                            }
                                .foregroundColor(.black)
                            Button {
                                if button2[2] {
                                    button2[2] = false
                                }
                                else {
                                    button2[2] = true
                                }
                            } label: {
                                if button2[2] {
                                    HStack {
                                        Image(systemName: "checkmark.square")
                                        Text("Anxiety")
                                    }
                                }
                                else {
                                    HStack {
                                        Image(systemName: "square")
                                        Text("Anxiety")
                                    }
                                }
                            }
                                .foregroundColor(.black)
                            Button {
                                if button2[3] {
                                    button2[3] = false
                                }
                                else {
                                    button2[3] = true
                                }
                            } label: {
                                if button2[3] {
                                    HStack {
                                        Image(systemName: "checkmark.square")
                                        Text("Arrythmia")
                                    }
                                }
                                else {
                                    HStack {
                                        Image(systemName: "square")
                                        Text("Arrythmia")
                                    }
                                }
                            }
                                .foregroundColor(.black)
                            Button {
                                if button2[4] {
                                    button2[4] = false
                                }
                                else {
                                    button2[4] = true
                                }
                            } label: {
                                if button2[4] {
                                    HStack {
                                        Image(systemName: "checkmark.square")
                                        Text("Asthma")
                                    }
                                }
                                else {
                                    HStack {
                                        Image(systemName: "square")
                                        Text("Asthma")
                                    }
                                }
                            }
                                .foregroundColor(.black)
                            Button {
                                if button2[5] {
                                    button2[5] = false
                                }
                                else {
                                    button2[5] = true
                                }
                            } label: {
                                if button2[5] {
                                    HStack {
                                        Image(systemName: "checkmark.square")
                                        Text("Bipolar")
                                    }
                                }
                                else {
                                    HStack {
                                        Image(systemName: "square")
                                        Text("Bipolar")
                                    }
                                }
                            }
                                .foregroundColor(.black)
                            Button {
                                if button2[6] {
                                    button2[6] = false
                                }
                                else {
                                    button2[6] = true
                                }
                            } label: {
                                if button2[6] {
                                    HStack {
                                        Image(systemName: "checkmark.square")
                                        Text("Blood clotting disorder")
                                    }
                                }
                                else {
                                    HStack {
                                        Image(systemName: "square")
                                        Text("Blood clotting disorder")
                                    }
                                }
                            }
                                .foregroundColor(.black)
                        }
                        Group {
                                Button {
                                    if button2[7] {
                                        button2[7] = false
                                    }
                                    else {
                                        button2[7] = true
                                    }
                                } label: {
                                    if button2[7] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Bowel incontinence")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Bowel incontinence")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[8] {
                                        button2[8] = false
                                    }
                                    else {
                                        button2[8] = true
                                    }
                                } label: {
                                    if button2[8] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Cancer")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Cancer")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[9] {
                                        button2[9] = false
                                    }
                                    else {
                                        button2[9] = true
                                    }
                                } label: {
                                    if button2[9] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Cellulitis")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Cellulitis")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[10] {
                                        button2[10] = false
                                    }
                                    else {
                                        button2[10] = true
                                    }
                                } label: {
                                    if button2[10] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Chronic back pain")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Chronic back pain")
                                        }
                                        
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[11] {
                                        button2[11] = false
                                    }
                                    else {
                                        button2[11] = true
                                    }
                                } label: {
                                    if button2[11] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Chronic neck pain")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Chronic neck pain")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[12] {
                                        button2[12] = false
                                    }
                                    else {
                                        button2[12] = true
                                    }
                                } label: {
                                    if button2[12] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Closed head injury")
                                        }

                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Closed head injury")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[13] {
                                        button2[13] = false
                                    }
                                    else {
                                        button2[13] = true
                                    }
                                } label: {
                                    if button2[13] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Colitis")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Colitis")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[14] {
                                        button2[14] = false
                                    }
                                    else {
                                        button2[14] = true
                                    }
                                } label: {
                                    if button2[14] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Congestive heart failure")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Congestive heart failure")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                        }
                        Group {
                                Button {
                                    if button2[15] {
                                        button2[15] = false
                                    }
                                    else {
                                        button2[15] = true
                                    }
                                } label: {
                                    if button2[15] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("COPD")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("COPD")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[16] {
                                        button2[16] = false
                                    }
                                    else {
                                        button2[16] = true
                                    }
                                } label: {
                                    if button2[16] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Crohn's disease")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Crohn's disease")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[17] {
                                        button2[17] = false
                                    }
                                    else {
                                        button2[17] = true
                                    }
                                } label: {
                                    if button2[17] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("CVA(stroke)")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("CVA(stroke)")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[18] {
                                        button2[18] = false
                                    }
                                    else {
                                        button2[18] = true
                                    }
                                } label: {
                                    if button2[18] {
                                        HStack(alignment: .top) {
                                            Image(systemName: "checkmark.square")
                                            Text("Degenerative disc disease")
                                        }
                                    }
                                    else {
                                        HStack(alignment: .top) {
                                            Image(systemName: "square")
                                            Text("Degenerative disc disease")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                        }
                    }
                    VStack(alignment: .leading, spacing: 5) {
                        Group {
                                Button {
                                    if button2[19] {
                                        button2[19] = false
                                    }
                                    else {
                                        button2[19] = true
                                    }
                                } label: {
                                    if button2[19] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Depression")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Depression")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[20] {
                                        button2[20] = false
                                    }
                                    else {
                                        button2[20] = true
                                    }
                                } label: {
                                    if button2[20] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Diabetes(type 1)")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Diabetes(type 1)")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[21] {
                                        button2[21] = false
                                    }
                                    else {
                                        button2[21] = true
                                    }
                                } label: {
                                    if button2[21] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Diabetes(type 2)")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Diabetes(type 2)")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[22] {
                                        button2[22] = false
                                    }
                                    else {
                                        button2[22] = true
                                    }
                                } label: {
                                    if button2[22] {
                                        HStack(alignment: .top) {
                                            Image(systemName: "checkmark.square")
                                            Text("DVT(deep vein thrombosis)")
                                        }
                                    }
                                    else {
                                        HStack(alignment: .top) {
                                            Image(systemName: "square")
                                            Text("DVT(deep vein thrombosis)")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                            VStack(alignment: .leading, spacing: 5) {
                                ForEach(0..<14) { index in
                                    Button {
                                        if button2[index + 23] {
                                            button2[index + 23] = false
                                        }
                                        else {
                                            button2[index + 23] = true
                                        }
                                    } label: {
                                        if button2[index + 23] {
                                            HStack {
                                                Image(systemName: "checkmark.square")
                                                Text(famHistName[index])
                                            }
                                        }
                                        else {
                                            HStack {
                                                Image(systemName: "square")
                                                Text(famHistName[index])
                                            }

                                        }
                                    }
                                    .foregroundColor(.black)
                                }
                            }
                        }
                    }
                    VStack(alignment: .leading, spacing: 5) {
                        Group {
                                Button {
                                    if button2[37] {
                                        button2[37] = false
                                    }
                                    else {
                                        button2[37] = true
                                    }
                                } label: {
                                    if button2[37] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Joint pain")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Joint pain")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[38] {
                                        button2[38] = false
                                    }
                                    else {
                                        button2[38] = true
                                    }
                                } label: {
                                    if button2[38] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Lymphedema")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Lymphedema")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[39] {
                                        button2[39] = false
                                    }
                                    else {
                                        button2[39] = true
                                    }
                                } label: {
                                    if button2[39] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Migraine headaches")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Migraine headaches")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[40] {
                                        button2[40] = false
                                    }
                                    else {
                                        button2[40] = true
                                    }
                                } label: {
                                    if button2[40] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("MI(heart attack)")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("MI(heart attack)")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[41] {
                                        button2[41] = false
                                    }
                                    else {
                                        button2[41] = true
                                    }
                                } label: {
                                    if button2[41] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("MRSA")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("MRSA")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[42] {
                                        button2[42] = false
                                    }
                                    else {
                                        button2[42] = true
                                    }
                                } label: {
                                    if button2[42] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Multiple Sclerosis")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Multiple Sclerosis")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[43] {
                                        button2[43] = false
                                    }
                                    else {
                                        button2[43] = true
                                    }
                                } label: {
                                    if button2[43] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Osteoarthritis")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Osteoarthritis")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                        }
                        Group {
                                Button {
                                    if button2[44] {
                                        button2[44] = false
                                    }
                                    else {
                                        button2[44] = true
                                    }
                                } label: {
                                    if button2[44] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Osteoporosis")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Osteoporosis")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[45] {
                                        button2[45] = false
                                    }
                                    else {
                                        button2[45] = true
                                    }
                                } label: {
                                    if button2[45] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Peripheral Neuropathy")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Peripheral Neuropathy")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[46] {
                                        button2[46] = false
                                    }
                                    else {
                                        button2[46] = true
                                    }
                                } label: {
                                    if button2[46] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Psoriatic Arthritis")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Psoriatic Arthritis")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[47] {
                                        button2[47] = false
                                    }
                                    else {
                                        button2[47] = true
                                    }
                                } label: {
                                    if button2[47] {
                                        HStack(alignment: .top) {
                                            Image(systemName: "checkmark.square")
                                            VStack(alignment: .leading) {
                                                Text("PVD(peripheral")
                                                Text("vascular disease)")
                                            }
                                        }
                                    }
                                    else {
                                        HStack(alignment: .top) {
                                            Image(systemName: "square")
                                            VStack(alignment: .leading) {
                                                Text("PVD(peripheral")
                                                Text("vascular disease)")
                                            }
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[48] {
                                        button2[48] = false
                                    }
                                    else {
                                        button2[48] = true
                                    }
                                } label: {
                                    if button2[48] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Rheumatoid Arthritis")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Rheumatoid Arthritis")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[49] {
                                        button2[49] = false
                                    }
                                    else {
                                        button2[49] = true
                                    }
                                } label: {
                                    if button2[49] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Scoliosis")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Scoliosis")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[50] {
                                        button2[50] = false
                                    }
                                    else {
                                        button2[50] = true
                                    }
                                } label: {
                                    if button2[50] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Seizure disorder")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Seizure disorder")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                        }
                        Group {
                                Button {
                                    if button2[51] {
                                        button2[51] = false
                                    }
                                    else {
                                        button2[51] = true
                                    }
                                } label: {
                                    if button2[51] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Shortness of breath")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Shortness of breath")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[52] {
                                        button2[52] = false
                                    }
                                    else {
                                        button2[52] = true
                                    }
                                } label: {
                                    if button2[52] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Sleeping disorder")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Sleeping disorder")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[53] {
                                        button2[53] = false
                                    }
                                    else {
                                        button2[53] = true
                                    }
                                } label: {
                                    if button2[53] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("TB(tuberculosis)")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("TB(tuberculosis)")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[54] {
                                        button2[54] = false
                                    }
                                    else {
                                        button2[54] = true
                                    }
                                } label: {
                                    if button2[54] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Urinary incontinence")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Urinary incontinence")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                        }
                    }
                }.padding(.vertical)
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
                            .focused($keyboardChange)

                        Text("Occupation: ")
                            .font(Font.title3.weight(.bold))
                        TextField("Text here", text: $occupation)
                            .accentColor(.black)
                            .textFieldStyle(.roundedBorder)
                            .frame(width: 350)
                            .padding(.bottom)
                            .focused($keyboardChange)

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
                                .focused($keyboardChange)


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
                            .focused($keyboardChange)
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
                                    .focused($keyboardChange)

                                Text("Reason for fall(s)?")
                                TextField("Reason", text: $reasonFall)
                                    .accentColor(.black)
                                    .textFieldStyle(.roundedBorder)
                                    .padding(.bottom, 5)
                                    .frame(width: 350)
                                    .focused($keyboardChange)
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
                .accentColor(.blue)
                .frame(width: UIScreen.main.bounds.width)
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
                            medView
                                .onDisappear {
                                    let image = medView.snapshot()
                                    model.makeAddPdf(image: image)

                                }
                            NavigationLink {
                                if model.showInsuranceIntake == true && model.includeInsuranceIntake == true {
                                    InsuranceIntakeView(survey: survey)
                                }
                                else if model.showInfoAndPolicies == true && model.includeInformationAndPolicies == true {
                                    InformationAndPoliciesView(survey: survey)
                                }
                                else if model.showPrivacyPolicy == true && model.includePrivacyPolicy == true {
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
                                        else {
                                            Text("Survey not found")
                                        }
                                    }
                                    else {
                                        FinishedView(survey: survey)
                                    }                            }
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
            }.padding(.top, UIScreen.main.bounds.width == 768 || UIScreen.main.bounds.width == 810 ? 0 : 15)

        }
            .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                keyboardChange = false
            }
            .padding(.bottom, keyboardChange ? UIScreen.main.bounds.height*3/10 : 0)
            .animation(.easeInOut(duration: 0.3), value: true)
    }
}


