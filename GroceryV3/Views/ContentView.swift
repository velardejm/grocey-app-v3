//
//  ContentView.swift
//  GroceryV3
//
//  Created by JM Velarde on 7/7/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var navPath = NavPath()
    
    var body: some View {
        TabView {
            RecipesView().tabItem {
                Text("Recipes")
            }
            
            TestView().tabItem {
                Text("Test")
            }
        }.environmentObject(navPath)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
