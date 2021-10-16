//
//  ContentView.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 10/16/21.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: SurveyModel
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink {
                    EnglishListView()
                } label: {
                    Text("English")
                }
                NavigationLink {
                    SpanishListView()
                } label: {
                    Text("Spanish")
                }

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(SurveyModel())
    }
}
