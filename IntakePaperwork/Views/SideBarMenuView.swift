//
//  SideBarMenuView.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 11/16/21.
//

import SwiftUI

struct SideBarMenuView: View {
    
    @EnvironmentObject var model: SurveyModel
    
    var body: some View {
        ZStack {
            BackgroundView()
            Rectangle()
                .foregroundColor(Color.init(.sRGB, red: 0.82745, green: 0.82745, blue: 0.82745, opacity: 1))
            VStack {
                Divider().padding(.bottom)
                NavigationLink {
                    SettingsView()
                } label: {
                    HStack {
                        Image(systemName: "gear")
                            .foregroundColor(.black)
                            .font(Font.title)
                        Text("Settings")
                            .font(Font.title)
                            .foregroundColor(.black)
                        Image(systemName: "chevron.right")
                            .padding(.leading, 230)
                            .foregroundColor(.black)
                        Spacer()
                    }.padding(.leading)
                }
                Divider()
                NavigationLink {
                    PDFRetrievalView()
                } label: {
                    HStack {
                        Image(systemName: "doc")
                            .foregroundColor(.black)
                            .font(Font.title)
                            .padding(.leading, 3)
                        Text("PDF retrieval")
                            .font(Font.title)
                            .foregroundColor(.black)
                        Image(systemName: "chevron.right")
                            .padding(.leading, 180)
                            .foregroundColor(.black)
                        Spacer()
                    }.padding(.leading)
                }
                Divider()
                Spacer()
            }
            
        }.frame(width: UIScreen.main.bounds.width/20)
            .navigationBarTitleDisplayMode( .inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Menu")
                        .bold()
                        .foregroundColor(.white)
                        .font(.largeTitle)
                }
            }
    }
}

struct SideBarMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideBarMenuView()
    }
}
