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
                .foregroundColor(.pink)
            VStack {
                Divider().padding(.bottom)
                NavigationLink {
                    SettingsView()
                } label: {
                    HStack {
                        Text("Settings")
                            .font(Font.title)
                            .foregroundColor(.black)
                        Image(systemName: "chevron.right")
                            .padding(.leading, 30)
                            .foregroundColor(.black)
                        Spacer()
                    }.padding(.leading)
                }
                Divider()
                NavigationLink {
                    PDFRetrievalView()
                } label: {
                    HStack {
                        Text("PDF retrieval")
                            .font(Font.title)
                            .foregroundColor(.black)
                        Image(systemName: "chevron.right")
                            .padding(.leading, 30)
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
