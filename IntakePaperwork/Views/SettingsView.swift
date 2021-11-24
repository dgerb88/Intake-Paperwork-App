//
//  SettingsView.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 11/16/21.
//

import SwiftUI

struct SettingsView: View {
   
    
    var body: some View {
        ZStack {
            BackgroundView()
                .frame(width: UIScreen.main.bounds.width)
            ZStack {
                VStack {
                    List {
                        Text("Settings")
                    }
                }
            }.padding(.top)
        }.navigationBarTitleDisplayMode( .inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Settings")
                        .bold()
                        .foregroundColor(.white)
                        .font(.largeTitle)
                }
            }

    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
