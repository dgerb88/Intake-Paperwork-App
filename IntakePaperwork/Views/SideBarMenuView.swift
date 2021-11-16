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
                .frame(width: UIScreen.main.bounds.width)
            ZStack {
                VStack {
                    List {
                        NavigationLink {
                            SettingsView()
                        } label: {
                            HStack {
                                Text("Settings")
                                    .font(Font.title)
                                Image(systemName: "chevron.right")
                                    .padding(.leading, 30)
                                Spacer()
                            }
                        }
                        Divider()
                        NavigationLink {
                            PDFRetrievalView()
                        } label: {
                            HStack {
                                Text("PDF retrieval")
                                    .font(Font.title)
                                Image(systemName: "chevron.right")
                                    .padding(.leading, 30)
                                Spacer()
                            }
                        }
                        Divider()
                    }.listStyle(SidebarListStyle())
                }
            }
        }
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
