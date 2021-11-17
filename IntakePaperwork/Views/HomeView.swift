//
//  ContentView.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 10/16/21.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: SurveyModel
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .center) {
                BackgroundView()
                NewSelectionView()
                    .frame(width: UIScreen.main.bounds.width)
                    .padding(.top)
                if model.sideBarShowing == true {
                    HStack(spacing: 0) {
                        SideBarMenuView()
                            .frame(width: UIScreen.main.bounds.width/20)
                            .padding(.leading, UIScreen.main.bounds.width)
                        NewSelectionView()
                            .frame(width: UIScreen.main.bounds.width)
                            .disabled(model.sideBarShowing ? true : false)
                            .onTapGesture(perform: {
                                model.sideBarShowing = false
                            })
                    }.frame(width: UIScreen.main.bounds.width*2)
                        .padding(.top)
                    .transition(.move(edge: .leading))
                }
            }.frame(width: UIScreen.main.bounds.width)
            .onAppear(perform: {
                model.sideBarShowing = false
            })
            .navigationBarTitleDisplayMode( .inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Forms Setup")
                            .bold()
                            .foregroundColor(.white)
                            .font(.largeTitle)
                    }
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            if model.sideBarShowing == true {
                                model.sideBarShowing = false
                            }
                            else {
                                withAnimation {
                                    model.sideBarShowing = true
                                }
                            }
                        } label: {
                            Image(systemName: "line.3.horizontal")
                                .foregroundColor(.white)
                                .font(Font.title.weight(.bold))
                        }
                    }
                    
                }
        }.navigationViewStyle(StackNavigationViewStyle())
            .accentColor(.white)
    }
}


