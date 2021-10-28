//
//  LanguageTabView.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 10/28/21.
//

import SwiftUI

struct LanguageTabView: View {
    var body: some View {
        TabView {
            EnglishSurveyListView()
                .tabItem {
                    Text("English")
                }
            SpanishSurveyListView()
                .tabItem {
                    Text("Spanish")
                }
        }
    }
}

struct LanguageTabView_Previews: PreviewProvider {
    static var previews: some View {
        LanguageTabView()
    }
}
