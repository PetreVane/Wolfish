//
//  WDetailViewModel.swift
//  Wolfish
//
//  Created by Petre Vane on 08/12/2020.
//

import SwiftUI

class WDetailViewModel: ObservableObject {
    
    @Published var selectedItems: [MealItem] = []
    
    func addItemToOrder(_ mealItem: MealItem) {
        selectedItems.append(mealItem)
        print("\(mealItem.name) has been added to list")
        print("Your list now contains \(selectedItems.count) items")
    }
}
