//
//  ContentView.swift
//  GroceryV3
//
//  Created by JM Velarde on 7/7/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            RecipesView().tabItem {
                Text("Recipes")
            }
            
            AddRecipeView().tabItem {
                Text("Add Recipe")
            }
            
            TestView().tabItem {
                Text("Test")
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
