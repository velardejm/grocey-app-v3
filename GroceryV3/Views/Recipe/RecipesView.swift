//
//  RecipesView.swift
//  GroceryV3
//
//  Created by JM Velarde on 7/7/23.
//

import SwiftUI

struct RecipesView: View {
    @Environment(\.managedObjectContext) var moc
    
    @EnvironmentObject var navPath: NavPath
    
    @FetchRequest(sortDescriptors: []) var recipes: FetchedResults<Recipe>
    
    var body: some View {
        NavigationStack(path: $navPath.navPath) {
            List {
                if recipes.count > 0 {
                    ForEach(recipes, id: \.self) {recipe in
                        NavigationLink(value: recipe) {
                            Text(recipe.wrappedName)
                        }
                    }.navigationDestination(for: Recipe.self) {recipe in
                        RecipeDetailView(recipe: recipe)
                    }
                }
            }.toolbar {
                ToolbarItem {
                    Button {
                        navPath.navPath.append("Add Recipe")
                    } label: {
                        HStack {
                            Text("Add Recipe")
                            Label("Add Recipe", systemImage: "plus")
                        }
                    }
                }
            }
            
            NavigationLink(value:"Add Recipe") {
                EmptyView()
            }.navigationDestination(for: String.self) {text in
                AddRecipeView()
            }
        }
    }
}

struct RecipesView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesView()
    }
}
