//
//  DataController.swift
//  GroceryV3
//
//  Created by JM Velarde on 7/7/23.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    var container = NSPersistentContainer(name: "AppData")
    
    init() {
        container.loadPersistentStores {description, error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
        
        self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
    }
    
}
