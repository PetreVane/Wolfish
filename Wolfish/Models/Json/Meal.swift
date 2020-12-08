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
        id: 000,
        price: 15.5,
        carbs: 75,
        protein: 50,
        calories: 250,
        name: "Yummy pancakes")
    
    static let sampleMeal1 = MealItem(
        requestDescription: "Test description",
        imageURL: "Image URL",
        id: 001,
        price: 5.5,
        carbs: 75,
        protein: 50,
        calories: 250,
        name: "Candies")
    
    static let sampleMeal2 = MealItem(
        requestDescription: "Test description",
        imageURL: "Image URL",
        id: 002,
        price: 30.5,
        carbs: 75,
        protein: 50,
        calories: 250,
        name: "Fried potatoes")
    
    static let sampleMeal3 = MealItem(
        requestDescription: "Test description",
        imageURL: "Image URL",
        id: 003,
        price: 25.5,
        carbs: 75,
        protein: 50,
        calories: 250,
        name: "Meat balls")
    
    static let meals = [sampleMeal, sampleMeal1, sampleMeal2, sampleMeal3]
}
