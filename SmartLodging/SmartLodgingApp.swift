//
//  SmartLodgingApp.swift
//  SmartLodging
//
//  Created by Simon Puchner on 28.09.22.
//

import SwiftUI

@main
struct SmartLodgingApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
