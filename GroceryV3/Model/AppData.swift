//
//  AppData.swift
//  GroceryV3
//
//  Created by JM Velarde on 7/9/23.
//

import SwiftUI
import Foundation

class AppData: ObservableObject {
    
    struct IngredientType: Codable {
        var id: Int
        let name: String
        let category: String
    }

    struct Category: Codable {
        var id: Int
        var name: String
    }
    
    @Published var categories:[Category] = []
    @Published var ingredientTypes:[IngredientType] = []
    @Published var navigationPath = NavigationPath()
    
    func load<T: Codable>(_ filename: String) -> T {
        guard let url = Bundle.main.url(forResource: filename, withExtension: nil) else {
            fatalError("An error occurred.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("An error occurred.")
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("An error occurred.")
        }
    }
    
    init() {
        categories = load("categories.json")
        ingredientTypes = load("ingredientTypes.json")
    }
}
