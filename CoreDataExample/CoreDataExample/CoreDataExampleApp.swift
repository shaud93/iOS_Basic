//
//  CoreDataExampleApp.swift
//  CoreDataExample
//
//  Created by D'Ante Watson on 11/23/23.
//

import SwiftUI

@main
struct CoreDataExampleApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
//            ContentView()
        }
    }
}
