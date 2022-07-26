//
//  BergBalance.swift
//  PaperlessWork
//
//  Created by Dax Gerber on 7/13/22.
//

import SwiftUI

struct BergBalance: View {
    
    @EnvironmentObject var model: SurveyModel
    @FocusState var keyboardChange: Bool
    var scoreBerg: Int {
        var score = 0
        for n in 0..<scoreArray.count {
            if scoreArray[n] == 5 {
                score = score + 0
            }
            else {
                score = score + scoreArray[n]
            }
        }
        return score
    }
    var survey: Survey
    @State var scoreArray = [Int(),Int(),Int(),Int(),Int(),Int(),Int(),Int(),Int(),Int(),Int(),Int(),Int(),Int()]
    
    var bergView: some View {
        ZStack {
            VStack {
                Group {
                    VStack(alignment: .center) {
                        Text("Berg Balance Scale")
                            .bold()
                            .font(.largeTitle)
                            .padding(.bottom, 30)
                    }.padding(.top)
                    VStack(alignment: .leading) {
                        Group {
                            Text("General Instructions")
                                .font(.title2)
                            Group {
                                Text("Please document each task and/or give instructions as written. When scoring, ")
                                + Text("please record the lowest response category that applies")
                                    .underline()
                                + Text(" for each item.")
                            }.padding(.bottom).fixedSize(horizontal: false, vertical: true)
                            Group {
                                Text("In most items, the subject is asked to maintain a given position for a specific time. Progressively more points are deducted if:").fixedSize(horizontal: false, vertical: true)
                                Text("  - the time or distance requirements are not met")
                                Text("  - the subject’s performance warrants supervision")
                                Text("  - the subject touches an external support or receives assistance from the examiner")
                                Text("Subject should understand that they must maintain their balance while attempting the tasks. The choices of which leg to stand on or how far to reach are left to the subject. Poor judgment will adversely influence the performance and the scoring.")
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                            HStack(alignment: .top) {
                                VStack(alignment: .leading) {
                                    Text("Scoring:")
                                        .bold()
                                    Text("A five-point scale, a range of 0-4.")
                                    Text("0 = lowest level of function")
                                    Text("4 = highest level of function.")
                                    Text("Highest possible score = 56")
                                    Text("Score of < 45 indicates a greater risk of falling")
                                }.padding(.trailing, 35)
                                VStack(alignment: .leading) {
                                    Text("Equipment:")
                                        .bold()
                                    Text("Yardstick")
                                    Text("One standard chair with arm rests")
                                    Text("One standard chair without arm rests")
                                    Text("Footstool/step")
                                    Text("Stopwatch or wristwatch")
                                    Text("15 foot walkway")
                                }
                            }.padding(.top)
                            Divider()
                                .padding(.vertical, 10)
                            VStack(alignment: .leading) {
                                ForEach(0..<14) { i in
                                    Text(survey.questions[i].title)
                                        .bold()
                                    Text(survey.questions[i].instructions!)
                                        .padding(.bottom, 1)
                                        .fixedSize(horizontal: false, vertical: true)
                                    VStack(alignment: .leading) {
                                        Button {
                                            getScoreArray(num: 0, index: i)
                                        } label: {
                                            HStack(alignment: .top) {
                                                if setBoldSelected(index: i) == 4 {
                                                    Image(systemName: "checkmark.square")
                                                        .foregroundColor(.black)
                                                }
                                                else {
                                                    Image(systemName: "square")
                                                        .foregroundColor(.black)
                                                }
                                                Text(survey.questions[i].rating[0])
                                                    .foregroundColor(.black)
                                            }
                                        }
                                        Button {
                                            getScoreArray(num: 1, index: i)
                                        } label: {
                                            HStack(alignment: .top) {
                                                if setBoldSelected(index: i) == 3 {
                                                    Image(systemName: "checkmark.square")
                                                        .foregroundColor(.black)
                                                }
                                                else {
                                                    Image(systemName: "square")
                                                        .foregroundColor(.black)
                                                }
                                                Text(survey.questions[i].rating[1])
                                                    .foregroundColor(.black)
                                            }
                                        }
                                        Button {
                                            getScoreArray(num: 2, index: i)
                                        } label: {
                                            HStack(alignment: .top) {
                                                if setBoldSelected(index: i) == 2 {
                                                    Image(systemName: "checkmark.square")
                                                        .foregroundColor(.black)
                                                }
                                                else {
                                                    Image(systemName: "square")
                                                        .foregroundColor(.black)
                                                }
                                                Text(survey.questions[i].rating[2])
                                                    .foregroundColor(.black)
                                            }
                                        }
                                        Button {
                                            getScoreArray(num: 3, index: i)
                                        } label: {
                                            HStack(alignment: .top) {
                                                if setBoldSelected(index: i) == 1 {
                                                    Image(systemName: "checkmark.square")
                                                        .foregroundColor(.black)
                                                }
                                                else {
                                                    Image(systemName: "square")
                                                        .foregroundColor(.black)
                                                }
                                                Text(survey.questions[i].rating[3])
                                                    .foregroundColor(.black)
                                            }
                                        }
                                        Button {
                                            getScoreArray(num: 4, index: i)
                                        } label: {
                                            HStack(alignment: .top) {
                                                if setBoldSelected(index: i) == 0 {
                                                    Image(systemName: "checkmark.square")
                                                        .foregroundColor(.black)
                                                }
                                                else {
                                                    Image(systemName: "square")
                                                        .foregroundColor(.black)
                                                }
                                                Text(survey.questions[i].rating[4])
                                                    .foregroundColor(.black)
                                            }
                                        }
                                    }.padding(.bottom)
                                }
                            }.padding(.leading, 20).padding(.bottom, 30)
                            HStack {
                                if model.eval == false {
                                    Text("Name:")
                                    TextField("", text: $model.personalName)
                                        .frame(width: 300)
                                        .padding(.horizontal, 20)
                                        .accentColor(.black)
                                        .textFieldStyle(.roundedBorder)
                                        .focused($keyboardChange)
                                }
                                Spacer()
                                Text("Score: \(scoreBerg)  ")
                                    .bold()
                                    .font(Font.title)
                                if scoreBerg > 40 {
                                    Text("low fall risk")
                                        .bold()
                                        .font(Font.title)
                                }
                                else if scoreBerg < 21 {
                                    Text("high fall risk")
                                        .bold()
                                        .font(Font.title)
                                }
                                else {
                                    Text("medium fall risk")
                                        .bold()
                                        .font(Font.title)
                                }
                            }.padding(.trailing, 35).padding(.bottom, 30)
                        }
                    }
                }
            }.padding(.horizontal)
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
                    .padding(.top, UIScreen.main.bounds.width == 768 || UIScreen.main.bounds.width == 810 ? 0 : 15)
                ScrollView {
                    VStack {
                        bergView
                            .onDisappear {
                                let image = bergView.snapshot()
                                model.PDFimage.append(image)
                                model.PDFfile = model.createPDF(image: image)
                                model.PDFfileArray.append(model.PDFfile!)
                            }
                        NavigationLink {
                            FinishedView(survey: survey)
                        } label: {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.green)
                                    .frame(height: 48)
                                    .cornerRadius(10)
                                    .shadow(radius: 1)
                                Text("Finish")
                                    .foregroundColor(.white)
                                    .font(.title)
                                    .bold()
                            }.padding().padding(.bottom)
                        }.navigationBarBackButtonHidden(model.eval)
                    }.padding(.horizontal,25)
                }
            }
        }.onAppear {
            for i in 0..<scoreArray.count {
                scoreArray[i] = 5
            }
        }
        .padding(.bottom, keyboardChange ? UIScreen.main.bounds.height*3/15 : 0)
    }
    
    func getScoreArray(num: Int, index: Int) {
        var numReturn = 0
        
        for i in 0..<14 {
            if i == index {
                scoreArray.remove(at: i)
                if num == 0 {
                    numReturn = 4
                }
                else if num == 1 {
                    numReturn = 3
                }
                else if num == 2 {
                    numReturn = 2
                }
                else if num == 3 {
                    numReturn = 1
                }
                else if num == 4 {
                    numReturn = 0
                }
                scoreArray.insert(numReturn, at: i)
            }
        }
    }
    
    func setBoldSelected(index: Int) -> Int {
        let array = scoreArray
        let bolded = array[index]
        return bolded
    }
}



