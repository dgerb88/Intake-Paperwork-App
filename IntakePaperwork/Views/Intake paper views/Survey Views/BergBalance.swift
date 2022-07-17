//
//  BergBalance.swift
//  PaperlessWork
//
//  Created by Dax Gerber on 7/13/22.
//

import SwiftUI

struct BergBalance: View {
    
    @EnvironmentObject var model: SurveyModel
    @State var scoreBerg = 0
    var survey: Survey
    var instructions = ["INSTRUCTIONS: Please stand up. Try not to use your hand for support.", "INSTRUCTIONS: Please stand for two minutes without holding on.", "INSTRUCTIONS: Please sit with arms folded for 2 minutes.", "INSTRUCTIONS: Please sit down.", "INSTRUCTIONS: Arrange chair(s) for pivot transfer. Ask subject to transfer one way toward a seat with armrests and one way toward a seat without armrests. You may use two chairs (one with and one without armrests) or a bed and a chair.", "INSTRUCTIONS: Please close your eyes and stand still for 10 seconds.", "INSTRUCTIONS: Place your feet together and stand without holding on.", "INSTRUCTIONS: Lift arm to 90 degrees. Stretch out your fingers and reach forward as far as you can. (Examiner places a ruler at the end of fingertips when arm is at 90 degrees. Fingers should not touch the ruler while reaching forward. The recorded measure is the distance forward that the fingers reach while the subject is in the most forward lean position. When possible, ask subject to use both arms when reaching to avoid rotation of the trunk.)", "INSTRUCTIONS: Pick up the shoe/slipper, which is place in front of your feet.", "INSTRUCTIONS: Turn to look directly behind you over toward the left shoulder. Repeat to the right. Examiner may pick an object to look at directly behind the subject to encourage a better twist turn.", "INSTRUCTIONS: Turn completely around in a full circle. Pause. Then turn a full circle in the other direction.", "INSTRUCTIONS: Place each foot alternately on the step/stool. Continue until each foot has touch the step/stool four times.", "INSTRUCTIONS: (DEMONSTRATE TO SUBJECT) Place one foot directly in front of the other. If you feel that you cannot place your foot directly in front, try to step far enough ahead that the heel of your forward foot is ahead of the toes of the other foot. (To score 3 points, the length of the step should exceed the length of the other foot and the width of the stance should approximate the subject’s normal stride width.)", "INSTRUCTIONS: Stand on one leg as long as you can without holding on."]
    
    var bergView: some View {
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
                        }.padding(.bottom)
                        Text("General Instructions")
                            .font(.title2)
                        Group {
                            Text("Please document each task and/or give instructions as written. When scoring, ")
                            + Text("please record the lowest response category that applies")
                                .underline()
                            + Text(" for each item.")
                        }.padding(.bottom)
                        Group {
                            Text("In most items, the subject is asked to maintain a given position for a specific time. Progressively more points are deducted if:")
                            Text("  - the time or distance requirements are not met")
                            Text("  - the subject’s performance warrants supervision")
                            Text("  - the subject touches an external support or receives assistance from the examiner")
                            Text("Subject should understand that they must maintain their balance while attempting the tasks. The choices of which leg to stand on or how far to reach are left to the subject. Poor judgment will adversely influence the performance and the scoring.")
                        }
                        Divider()
                            .padding(.vertical, 10)
                        VStack(alignment: .leading) {
                            ForEach(0..<14) { i in
                                Text(survey.questions[i].title)
                                    .bold()
                                Text(instructions[i])
                                    .padding(.bottom, 1)
                                VStack(alignment: .leading) {
                                    ForEach(0..<survey.questions[i].rating.count, id: \.self) { r in
                                        HStack(alignment: .top) {
                                            if r == 0 {
                                                Text("4  ")
                                            }
                                            else if r == 1 {
                                                Text("3  ")
                                            }
                                            else if r == 2 {
                                                Text("2  ")
                                            }
                                            else if r == 3 {
                                                Text("1  ")
                                            }
                                            else {
                                                Text("0  ")
                                            }
                                            Text(survey.questions[i].rating[r])
                                        }
                                    }
                                }.padding(.bottom)
                            }
                        }.padding(.leading, 30).padding(.bottom, 30)
                        HStack {
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
        }
    }
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    bergView
                }.padding(25)
            }
        }
    }
}


