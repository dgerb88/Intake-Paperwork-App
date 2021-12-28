//
//  IntakePaperworkApp.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 10/16/21.
//

import SwiftUI

    @main
struct IntakePaperworkApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(SurveyModel())
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
