//
//  Ingredient+CoreDataProperties.swift
//  GroceryV3
//
//  Created by JM Velarde on 7/8/23.
//
//

import Foundation
import CoreData


extension Ingredient {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Ingredient> {
        return NSFetchRequest<Ingredient>(entityName: "Ingredient")
    }

    @NSManaged public var name: String?
    @NSManaged public var quantity: Float
    @NSManaged public var unit: String?
    @NSManaged public var category: String?
    @NSManaged public var recipe: Recipe?
    
    public var wrappedName: String {
        name ?? "Unknown Ingredient"
    }
    
    public var wrappedUnit: String {
        unit ?? ""
    }
    
    public var wrappedCategory: String {
        category ?? ""
    }

}

extension Ingredient : Identifiable {

}
