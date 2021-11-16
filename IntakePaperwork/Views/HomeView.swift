//
//  ContentView.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 10/16/21.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: SurveyModel
    
    var selectionHeight: Int {
        if model.eval == true {
            return 15
        }
        else {
            return 7
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                VStack {
                    ZStack {
                        SideBarMenuView()
                            .frame(width: UIScreen.main.bounds.width/3)
                        HStack {
                            if model.sideBarShowing == true {
                                Spacer()
                                NewSelectionView()
                                    .frame(width: UIScreen.main.bounds.width*2/3)
                            }
                            else {
                                NewSelectionView()
                                    .frame(width: UIScreen.main.bounds.width)
                            }
                        }
                            
                        
                    }
                }.padding(.top, 10)
                        
                
            }.onAppear(perform: {
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
                                model.sideBarShowing = true
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


