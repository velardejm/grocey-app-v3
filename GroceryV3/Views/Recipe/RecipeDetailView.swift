//
//  RecipeDetailView.swift
//  GroceryV3
//
//  Created by JM Velarde on 7/7/23.
//

import SwiftUI

struct RecipeDetailView: View {
    
    @State var recipe:Recipe
    
    var body: some View {
        
        List {
            Section {
                Text(recipe.wrappedName)
            }
            
            Section {
                ForEach(recipe.ingredientsArray, id: \.self) {ingredient in
                    Text(ingredient.wrappedName)
                }
            }
        }
        
    }
}

//struct RecipeDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        RecipeDetailView()
//    }
//}
