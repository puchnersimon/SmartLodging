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
                        Label {
                            Text("Home")
                                .foregroundColor(Color.red)
                        } icon: {
                            Image(systemName: "house")
                                .foregroundColor(Color.green)
                        }
                        
                    }
                  
                OrderView()
                    .tabItem {
                        Label("Order", systemImage: "cart")
                    }
                ActivityView()
                    .tabItem {
                        Label("Activity", systemImage: "figure.climbing")
                    }
                AccountView()
                    .tabItem {
                        Label("Account", systemImage: "person")
                    }
                }//.environmentObject(//viewModel)
        }
    }
}
