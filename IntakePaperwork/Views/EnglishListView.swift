//
//  EnlglishListView.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 10/16/21.
//

import SwiftUI

struct EnglishListView: View {
    
    @EnvironmentObject var model: SurveyModel
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(model.surveys) { survey in
                    NavigationLink {
                        SurveyView()
                    } label: {
                        Text(survey.name)
                    }
                }
            }
        }
    }
}
struct EnglishListView_Previews: PreviewProvider {
    static var previews: some View {
        EnglishListView()
            .environmentObject(SurveyModel())
    }
}
