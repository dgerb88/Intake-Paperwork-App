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
                        NewSelectionView()
                            .padding()
                            .frame(width: UIScreen.main.bounds.width-40)
                        Spacer()
                    }.padding(.top, 20)
                        
                
            }.navigationBarTitleDisplayMode( .inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Forms Setup")
                            .bold()
                            .foregroundColor(.white)
                            .font(.largeTitle)
                    }
                }
        }.navigationViewStyle(StackNavigationViewStyle())
            .accentColor(.white)
    }
}


