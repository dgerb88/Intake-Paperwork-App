//
//  SideBarMenuView.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 11/16/21.
//

import SwiftUI

struct SideBarMenuView: View {
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
                                Spacer()
                                Image(systemName: "chevron.right")
                            }
                        }
                        Divider()
                        NavigationLink {
                            PDFRetrievalView()
                        } label: {
                            HStack {
                                Text("PDF retrieval")
                                    .font(Font.title)
                                Spacer()
                                Image(systemName: "chevron.right")
                            }
                        }
                        Divider()
                    }.listStyle(SidebarListStyle())
                }
            }.padding(.top)
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
