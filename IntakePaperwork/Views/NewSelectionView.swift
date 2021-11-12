//
//  NewSelectionView.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 11/12/21.
//

import SwiftUI

struct NewSelectionView: View {
    
    @EnvironmentObject var model: SurveyModel
    @State var LefsSelected = false
    @State var NdiSelected = false
    @State var QuickDashSelected = false
    @State var BackIndexSelected = false
    @State var isEnglish = true
    @State var isSpanish = false
    var language:String {
        if isEnglish == true {
            return "English"
        }
        else {
            return "Spanish"
        }
    }
    
    var nameSelected: String {
        if QuickDashSelected == true {
            return "QuickDash"
        }
        else if NdiSelected == true {
            return "Neck Disability Index"
        }
        else if BackIndexSelected == true {
            return "Back Index"
        }
        else if LefsSelected == true {
            return "LEFS"
        }
        else {
            return ""
        }
    }

    
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(5)
                .shadow(radius: 5)
            VStack {
                VStack {
                    Button {
                        if isEnglish == false {
                            isEnglish = true
                            isSpanish = false
                        }
                        
                    } label: {
                        if isEnglish == true {
                            HStack {
                                Text("English")
                                    .foregroundColor(.green)
                                    .font(.title2)
                                Spacer()
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.green)
                            }.padding(.horizontal, 20)
                        }
                        else {
                            HStack {
                                Text("English")
                                    .foregroundColor(.black)
                                    .font(.title2)
                                Spacer()
                            }.padding(.horizontal, 20)
                        }
                    }
                    Button {
                        if isSpanish == false {
                            isEnglish = false
                            isSpanish = true
                        }

                    } label: {
                        if isSpanish == true {
                            HStack {
                                Text("Spanish")
                                    .foregroundColor(.green)
                                    .font(.title2)
                                Spacer()
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.green)
                            }.padding(.horizontal, 20)
                        }
                        else {
                            HStack {
                                Text("Spanish")
                                    .foregroundColor(.black)
                                    .font(.title2)
                                Spacer()
                            }.padding(.horizontal, 20)
                        }
                    }
                }
                VStack {
                    Button {
                        if LefsSelected == true {
                            LefsSelected = false
                        }
                        else {
                            LefsSelected = true
                            BackIndexSelected = false
                            NdiSelected = false
                            QuickDashSelected = false
                        }
                    } label: {
                        if LefsSelected == true {
                            HStack {
                                Text("LEFS")
                                    .foregroundColor(.green)
                                .font(.title2)
                                Spacer()
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.green)
                            }.padding(.horizontal, 20)
                        }
                        else {
                            HStack {
                                Text("LEFS")
                                    .foregroundColor(.black)
                                .font(.title2)
                                Spacer()
                            }.padding(.horizontal, 20)
                        }
                    }
                    Button {
                        if NdiSelected == true {
                            NdiSelected = false
                        }
                        else {
                            NdiSelected = true
                            BackIndexSelected = false
                            LefsSelected = false
                            QuickDashSelected = false
                        }
                    } label: {
                        if NdiSelected == true {
                            HStack {
                                Text("NDI")
                                    .foregroundColor(.green)
                                .font(.title2)
                                Spacer()
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.green)
                            }.padding(.horizontal, 20)
                        }
                        else {
                            HStack {
                                Text("NDI")
                                    .foregroundColor(.black)
                                .font(.title2)
                                Spacer()
                            }.padding(.horizontal, 20)
                        }
                    }
                    Button {
                        if BackIndexSelected == true {
                            BackIndexSelected = false
                        }
                        else {
                            BackIndexSelected = true
                            LefsSelected = false
                            NdiSelected = false
                            QuickDashSelected = false
                        }
                    } label: {
                        if BackIndexSelected == true {
                            HStack {
                                Text("Back Index")
                                    .foregroundColor(.green)
                                .font(.title2)
                                Spacer()
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.green)
                            }.padding(.horizontal, 20)
                        }
                        else {
                            HStack {
                                Text("Back Index")
                                    .foregroundColor(.black)
                                .font(.title2)
                                Spacer()
                            }.padding(.horizontal, 20)
                        }
                    }
                    Button {
                        if QuickDashSelected == true {
                            QuickDashSelected = false
                        }
                        else {
                            QuickDashSelected = true
                            BackIndexSelected = false
                            NdiSelected = false
                            LefsSelected = false
                        }
                    } label: {
                        if QuickDashSelected == true {
                            HStack {
                                Text("Quick Dash")
                                    .foregroundColor(.green)
                                    .font(.title2)
                                Spacer()
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.green)
                            }.padding(.horizontal, 20)
                        }
                        else {
                            HStack {
                                Text("Quick Dash")
                                    .foregroundColor(.black)
                                    .font(.title2)
                                Spacer()
                            }.padding(.horizontal, 20)
                        }
                    }

                }
                VStack {
                    ForEach(model.surveys) { survey in
                        if survey.name == nameSelected && survey.language == language {
                            NavigationLink {
                                SurveyView(survey: survey)
                                    .onAppear {
                                        model.appendArray(survey.questions.count)
                                    }
                            } label: {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.green)
                                        .frame(height: 48)
                                        .cornerRadius(10)
                                        .shadow(radius: 1)
                                    Text("Go")
                                        .bold()
                                        .font(.title)
                                        .foregroundColor(.white)
                                }
                            }
                        }
                    }
                }
                Spacer()
            }.padding()
        }
        
    }
}


struct NewSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        NewSelectionView()
    }
}
