//
//  MedicalHistoryView.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 10/28/21.
//

import SwiftUI

struct MedicalHistoryView: View {
    
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    
    @State var primaryReason = 0
    @State var primaryReasonOther = ""
    @State var dateProblemStarted = ""
    @State private var button = [false, false, false, false, false, false, false, false, false, false, false]
    @State var diagnosticTesting = ""
    @State var secondReason = ""
    @State var historyCondition = ""
    @State var dateSurgery = ""
    @State var typeSurgery = ""
    @State var dateNextDoc = ""
    @State var PTin12 = ""
    @State var weeksPregnant = ""
    
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(5)
                .shadow(radius: 5)
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
                                .font(Font.title2.weight(.bold))
                            Picker("", selection: $primaryReason) {
                                Text("Other").tag(7)
                                Text("Balance problems").tag(6)
                                Text("Hand problems").tag(4)
                                Text("Leg or foot problems").tag(5)
                                Text("Shoulder or arm problems").tag(3)
                                Text("Neck pain").tag(2)
                                Text("Back pain").tag(1)
                                Text("Please select").tag(0)
                            }.pickerStyle(MenuPickerStyle())
                                .padding(.leading)
                            if primaryReason == 7 {
                                Text("Please describe:")
                                TextField("Reason", text: $primaryReasonOther)
                                    .accentColor(.black)
                                    .textFieldStyle(.roundedBorder)
                                    .padding(.bottom, 5)
                                    .frame(width: 350)
                            }
                            Text("Date Condition began:")
                                .font(Font.title2.weight(.bold))
                                .padding(.top)
                            TextField("Date", text: $dateProblemStarted)
                                .accentColor(.black)
                                .textFieldStyle(.roundedBorder)
                                .padding(.bottom, 5)
                                .frame(width: 350)
                        }
                        VStack(alignment: .leading) {
                            Text("Is this a work-related injury?")
                                .font(Font.title2.weight(.bold))
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
                                .font(Font.title2.weight(.bold))
                                .padding(.top)
                            TextField("Date", text: $dateSurgery)
                                .accentColor(.black)
                                .textFieldStyle(.roundedBorder)
                                .frame(width: 350)
                            if dateSurgery != "" {
                                Text("Type of surgery:")
                                    .font(Font.title2.weight(.bold))
                                    .padding(.top)
                                TextField("Surgery type", text: $typeSurgery)
                                    .accentColor(.black)
                                    .textFieldStyle(.roundedBorder)
                                    .frame(width: 350)
                            }
                            Text("Date of next doctor appointment for this condition:")
                                .font(Font.title2.weight(.bold))
                                .padding(.top)
                                .fixedSize(horizontal: false, vertical: true)
                            TextField("Date", text: $dateNextDoc)
                                .accentColor(.black)
                                .textFieldStyle(.roundedBorder)
                                .frame(width: 350)
                        }
                        VStack(alignment: .leading) {
                            Text("Have you had any diagnostic tests related to this condition? i.e. X-Ray, MRI, Ultrasound, etc.")
                                .font(Font.title2.weight(.bold))
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
                                .padding(.top)
                                .padding(.bottom, 5)
                                .font(Font.title2.weight(.bold))
                                .fixedSize(horizontal: false, vertical: true)
                            TextField("Reason", text: $secondReason)
                                .accentColor(.black)
                                .textFieldStyle(.roundedBorder)
                                .frame(width: 350)
                            Text("Please describe the onset and history of current condition(s):")
                                .padding(.top)
                                .padding(.bottom, 5)
                                .font(Font.title2.weight(.bold))
                                .fixedSize(horizontal: false, vertical: true)
                            TextEditor(text: $historyCondition)
                                .background(Color.init(.sRGB, red: 0.92941, green: 0.92941, blue: 0.92941, opacity: 1))
                                .frame(width: 350, height: 75)
                        }
                        VStack(alignment: .leading) {
                            Text("Have you received physical therapy in the last 12 months?")
                                .padding(.top)
                                .padding(.bottom, 5)
                                .font(Font.title2.weight(.bold))
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
                                .font(Font.title2.weight(.bold))
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
                                .font(Font.title2.weight(.bold))
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
                                
                            }

                            

                            
                        }
                    }
                }
                Divider().padding(.vertical)
                
            }.padding()
        }.accentColor(.blue)
    }
}

struct MedicalHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        MedicalHistoryView()
    }
}
