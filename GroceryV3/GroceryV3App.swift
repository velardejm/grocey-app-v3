//
//  GroceryV3App.swift
//  GroceryV3
//
//  Created by JM Velarde on 7/7/23.
//

import SwiftUI

@main
struct GroceryV3App: App {
    @StateObject var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
