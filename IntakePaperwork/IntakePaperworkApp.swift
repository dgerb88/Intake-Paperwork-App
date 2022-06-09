//
//  IntakePaperworkApp.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 10/16/21.
//

import SwiftUI
import RevenueCat

    @main
struct IntakePaperworkApp: App {
    let persistenceController = PersistenceController.shared
    
    init() {
        Purchases.logLevel = .debug
        Purchases.configure(withAPIKey: "appl_PWLYzRggQruwncIXmKwHlRrPzis")
    }
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(SurveyModel())
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
