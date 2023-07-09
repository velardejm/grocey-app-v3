//
//  AddRecipeView.swift
//  GroceryV3
//
//  Created by JM Velarde on 7/7/23.
//

import SwiftUI

struct AddRecipeView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var recipeName = ""
    @State private var ingredientName = ""
    @State private var quantity: Float? = nil
    @State private var unit = ""
    @State private var category = "others"
    
    @State private var newRecipe: Recipe? = nil
     
    var body: some View {
        
        return List {
            
            Section {
                TextField("Recipe Name", text:$recipeName)
            }
            
            Section {
                TextField("Ingredient Name", text:$ingredientName)
                TextField("Quantity", value:$quantity, format: .number)
                TextField("Unit", text:$unit)
                Picker("Category", selection: $category) {
                    ForEach(categories, id: \.name) {category in
                        Text(category.name)
                    }
                }
                
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
                    // try? moc.save()
                    dismiss()
                    
                }
            }
            
            Section {
                if let ingredients = newRecipe?.ingredientsArray {
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
