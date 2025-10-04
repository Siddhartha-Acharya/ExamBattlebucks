//
//  ExamBattlebucksApp.swift
//  ExamBattlebucks
//
//  Created by selegic mac 01 on 03/10/25.
//

import SwiftUI
import CoreData

@main
struct ExamBattlebucksApp: App {
//    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            TabView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
