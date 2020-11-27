//
//  Meal.swift
//  Wolfish
//
//  Created by Petre Vane on 26/11/2020.
//

import Foundation


struct Meal: Decodable {
    
    let request: [MealItem]
}

// MARK: - Request
struct MealItem: Decodable, Identifiable {
    let requestDescription: String
    let imageURL: String
    let id: Int
    let price: Double
    let carbs, protein, calories: Int
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case requestDescription = "description"
        case imageURL, id, price, carbs, protein, calories, name
    }
}


struct MockData {
    
    static let sampleMeal = MealItem(
        requestDescription: "Test description",
        imageURL: "Image URL",
        id: 75,
        price: 25.5,
        carbs: 75,
        protein: 50,
        calories: 250,
        name: "Yummy pancakes")
    
    static let meals = [sampleMeal, sampleMeal, sampleMeal, sampleMeal, sampleMeal, sampleMeal]
}
