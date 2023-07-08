//
//  TestView.swift
//  GroceryV3
//
//  Created by JM Velarde on 7/8/23.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        List {
            Section {
                ForEach(ingredientTypes, id: \.id) {type in
                    Text("\(type.name) - \(type.category)")
                }
            }
            
            Section {
                ForEach(categories, id: \.id) {category in
                    Text(category.name)
                }
            }
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
