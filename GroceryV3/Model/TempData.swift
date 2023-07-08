//
//  TempData.swift
//  GroceryV3
//
//  Created by JM Velarde on 7/8/23.
//

import Foundation

struct IngredientType: Codable {
    var id: Int
    let name: String
    let category: String
}

struct Category: Codable {
    var id: Int
    var name: String
}

let ingredientTypes: [IngredientType] = load("ingredientTypes.json")
let categories: [Category] = load("categories.json")


func load<T:Codable>(_ filename:String) -> T{
    
    // Get url from main bundle
    guard let url = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("URL not found.")
    }
    
    // Load data from url
    guard let data = try? Data(contentsOf: url) else {
        fatalError("Data could not be loaded.")
    }
    
    // Return the decoded data
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Error")
    }
}
