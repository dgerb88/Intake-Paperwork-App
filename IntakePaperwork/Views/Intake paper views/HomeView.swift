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
            if model.confirmPurchase == true {
                PurchaseSubscription()
            }
            else {
                if model.confirmSettings == false {
                    Onboarding()
                }
                else {
                    ZStack(alignment: .center) {
                        BackgroundView()
                        ZStack(alignment: .leading) {
                            NewSelectionView()
                                .frame(width: UIScreen.main.bounds.width)
                                .disabled(model.sideBarShowing ? true : false)
                                .onTapGesture(perform: {
                                    withAnimation {
                                        model.sideBarShowing = false
                                    }
                                })
                            ZStack(alignment: .leading) {
                                Rectangle()
                                    .foregroundColor(Color.init(.sRGB, red: 0.92941, green: 0.92941, blue: 0.92941, opacity: 1))
                                    .frame(width: model.sideBarShowing ? UIScreen.main.bounds.width/2 : 0)
                                    .transition(.move(edge: .leading))
                                    .border(Color.gray, width: 1)
                                List {
                                    NavigationLink {
                                        SettingsView()
                                    } label: {
                                        HStack {
                                            Image(systemName: "gearshape")
                                                .foregroundColor(.black)
                                                .font(Font.title)
                                            Text("Settings")
                                                .font(Font.title)
                                                .foregroundColor(.black)
                                                .padding(.trailing, 50)
                                            Spacer()
                                        }.padding(.leading).padding(.vertical)
                                    }
                                    NavigationLink(tag: 1,
                                selection: $model.viewSelectionInt) {
                                        LockedView()
                                    } label: {
                                        HStack {
                                            Image(systemName: "doc")
                                                .foregroundColor(.black)
                                                .font(Font.title)
                                                .padding(.leading, 3)
                                            Text("PDF retrieval")
                                                .font(Font.title)
                                                .foregroundColor(.black)
                                                .padding(.trailing, 50)
                                            Spacer()
                                        }.padding(.leading).padding(.vertical)
                                    }
                                    NavigationLink {
                                        Support()
                                    } label: {
                                        HStack {
                                            Image(systemName: "envelope")
                                                .foregroundColor(.black)
                                                .font(Font.title)
                                            Text("Support")
                                                .font(Font.title)
                                                .foregroundColor(.black)
                                                .padding(.trailing, 50)
                                            Spacer()
                                        }.padding(.leading).padding(.vertical)
                                    }
                                }.frame(width: model.sideBarShowing ? UIScreen.main.bounds.width/2 : 0)
                                
                            }.frame(width: model.sideBarShowing ? UIScreen.main.bounds.width/2 : 0)
                        }
                        .frame(width: UIScreen.main.bounds.width*2)
                            .padding(.top)
                        .transition(.move(edge: .leading))
                        
                    }
                    .frame(width: UIScreen.main.bounds.width)
                    .onAppear(perform: {
                        model.sideBarShowing = false
                    })
                    .navigationBarBackButtonHidden(true)
                    .navigationBarTitleDisplayMode( .inline)
                        .toolbar {
                            ToolbarItem(placement: .principal) {
                                Text("Home")
                                    .bold()
                                    .foregroundColor(.white)
                                    .font(.largeTitle)
                            }
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button {
                                    if model.sideBarShowing == true {
                                        withAnimation {
                                            model.sideBarShowing = false
                                        }
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
                }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
            .accentColor(.white)
    }
}


