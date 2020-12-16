//
//  OrderDataFlow.swift
//  Wolfish
//
//  Created by Petre Vane on 16/12/2020.
//

import SwiftUI


final class OrderDataFlow: ObservableObject {
    
    @Published var mealItems: [MealItem] = []
    
    var totalPrice: Double {
        get {
            return mealItems.reduce(0) {$0 + $1.price} 
        }
    }
    
    func addItem(_ newMealItem: MealItem) {
        mealItems.append(newMealItem)
    }
    
    func removeItem(_ mealItemIndexSet: IndexSet) {
        mealItems.remove(atOffsets: mealItemIndexSet)
    }
}
