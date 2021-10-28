//
//  SpanishSurveyListView.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 10/28/21.
//

import SwiftUI

struct SpanishSurveyListView: View {
    
    @EnvironmentObject var model: SurveyModel
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                ScrollView {
                    GeometryReader { geo in
                        LazyVStack(spacing: 20) {
                            Text("Spanish")
                                .bold()
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .padding(.bottom, 20)
                            ForEach(model.surveys) { survey in
                                if survey.language == "Spanish" {
                                    NavigationLink {
                                        SurveyView(survey: survey)
                                            .onAppear {
                                                model.appendArray(survey.questions.count)
                                            }
                                    } label: {
                                            ZStack {
                                                Rectangle()
                                                    .foregroundColor(.white)
                                                    .cornerRadius(5)
                                                    .shadow(radius: 5)
                                                    .frame(height: 75)
                                                    .padding(.horizontal, geo.size.width*2/9)
                                                Text(survey.name)
                                                    .font(.title)
                                                    .bold()
                                                    .foregroundColor(.black)
                                            }
                                    }
                                }
                            }
                        }.padding()
                            .padding(.top, 30)
                    }
                }
            }
        }
    }
}

struct SpanishSurveyListView_Previews: PreviewProvider {
    static var previews: some View {
        SpanishSurveyListView()
    }
}
