//
//  IntakePaperworkApp.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 10/16/21.
//

import SwiftUI

@main
struct IntakePaperworkApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(SurveyModel())
        }
    }
}
