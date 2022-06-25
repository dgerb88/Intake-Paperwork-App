//
//  Onboarding.swift
//  PaperlessWork
//
//  Created by Dax Gerber on 6/22/22.
//

import SwiftUI

struct Onboarding: View {
    
    @EnvironmentObject var model: SurveyModel
    @State var imageNum = 0
    
    var body: some View {
        ZStack(alignment: .top) {
            BackgroundView()
            VStack(spacing: 0) {
                TabView(selection: $imageNum) {
                    Image("HomeScreen")
                        .resizable()
                        .border(.white, width: 3)
                        .cornerRadius(5)
                        .tag(0)
                    Image(systemName: "arrow.right")
                        .resizable()
                        .tag(1)
                    Image(systemName: "circle")
                        .resizable()
                        .tag(2)
                    Image(systemName: "circle.fill")
                        .resizable()
                        .tag(3)

                }
                .frame(width: UIScreen.main.bounds.width*5/6, height: UIScreen.main.bounds.height*5/6)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
                
                ZStack {
                    HStack {
                        if imageNum != 0 {
                            Button {
                                imageNum -= 1
                            } label: {
                                Text("Back")
                                    .font(Font.title2)
                            }
                        }
                        Spacer()
                        if imageNum == 3 {
                            NavigationLink {
                                SettingsView()
                            } label: {
                                Text("Finish")
                                    .font(Font.title2)
                            }
                        }
                        else {
                            Button {
                                imageNum += 1
                            } label: {
                                Text("Next")
                                    .font(Font.title2)
                            }

                        }
                    }
                        .frame(width: UIScreen.main.bounds.width*5/6 - 40)
                        .padding(.top, 20)
                    HStack(spacing: 0) {
                        Text(". ")
                            .bold()
                            .font(Font.title)
                            .foregroundColor(.white)
                            .opacity(imageNum == 0 ? 1 : 0.5)
                        Text(". ")
                            .bold()
                            .font(Font.title)
                            .foregroundColor(.white)
                            .opacity(imageNum == 1 ? 1 : 0.5)
                        Text(". ")
                            .bold()
                            .font(Font.title)
                            .foregroundColor(.white)
                            .opacity(imageNum == 2 ? 1 : 0.5)
                        Text(".")
                            .bold()
                            .font(Font.title)
                            .foregroundColor(.white)
                            .opacity(imageNum == 3 ? 1 : 0.5)
                    }
                        .frame(width: UIScreen.main.bounds.width*5/6 - 40)
                        .padding(.top, 20)
                }
            Spacer()
            }.padding(.top, 30)
            .navigationBarTitleDisplayMode( .inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Look how this works")
                            .bold()
                            .foregroundColor(.white)
                            .font(.largeTitle)
                    }
                }
        }
    }
}


