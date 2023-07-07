//
//  RecipesView.swift
//  GroceryV3
//
//  Created by JM Velarde on 7/7/23.
//

import SwiftUI

struct RecipesView: View {
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(sortDescriptors: []) var recipes: FetchedResults<Recipe>
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(recipes, id: \.self) {recipe in
                    NavigationLink {
                        RecipeDetailView(recipe: recipe)
                    } label: {
                        Text(recipe.wrappedName)
                    }
                }
            }
        }
    }
}

struct RecipesView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesView()
    }
}
