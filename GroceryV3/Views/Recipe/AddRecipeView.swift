//
//  AddRecipeView.swift
//  GroceryV3
//
//  Created by JM Velarde on 7/7/23.
//

import SwiftUI

struct AddRecipeView: View {
    @Environment(\.managedObjectContext) var moc
    
    @State private var recipeName = ""
    @State private var ingredientName = ""
    @State private var quantity: Float? = nil
    @State private var unit = ""
    
    @State private var newRecipe: Recipe? = nil
    
    var body: some View {
        List {
            Section {
                TextField("Recipe Name", text:$recipeName)
            }
            
            Section {
                TextField("Ingredient Name", text:$ingredientName)
                TextField("Quantity", value:$quantity, format: .number)
                TextField("Unit", text:$unit)
                
                Button("Add Ingredient") {
                    if newRecipe == nil {
                        let recipe = Recipe(context: moc)
                        newRecipe = recipe
                        recipe.name = recipeName
                    }
                    
                    let newIngredient = Ingredient(context: moc)
                    newIngredient.name = ingredientName
                    newIngredient.quantity = quantity ?? 0
                    newIngredient.unit = unit
                    newIngredient.recipe = newRecipe
                    
                    ingredientName = "."
                    ingredientName = ""
                    quantity = nil
                    unit = ""
                }
                
                Button("Save Recipe") {
                    try? moc.save()
                    recipeName = ""
                    ingredientName = ""
                    quantity = nil
                    newRecipe = nil
                }
            }
            
            Section {
                if let ingredients = newRecipe?.ingredientArray {
                    ForEach(ingredients, id: \.self) {ingredient in
                        Text(ingredient.wrappedName)
                    }
                }
            }
            
        }
    }
}

struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView()
    }
}
