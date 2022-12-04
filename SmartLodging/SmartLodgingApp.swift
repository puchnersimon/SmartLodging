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
    //create viewModel !!!

    var body: some Scene {
        WindowGroup {
            TabView {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                OrderView()
                    .tabItem {
                        Label("Order", systemImage: "cart")
                    }
                AccountView()
                    .tabItem {
                        Label("Account", systemImage: "person")
                    }
            }//.environmentObject(//viewModel)
        }
    }
}
