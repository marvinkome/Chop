//
//  Ingredient.swift
//  Chop
//
//  Created by Marvin Kome on 29.02.24.
//

import Foundation
import SwiftData

@Observable
class Ingredient {
    var id: UUID = UUID()
    
    var name: String
    var portionSize: Double
    
    var carbs: Double
    var protein: Double
    var fat: Double
    
    var calories: Double? = nil
    
    var estimatedCalories: Double {
        (carbs * 4) + (protein * 4) + (fat * 8)
    }
    
    init(name: String, portionSize: Double, carbs: Double, protein: Double, fat: Double, calories: Double? = nil) {
        self.name = name
        self.portionSize = portionSize
        self.carbs = carbs
        self.protein = protein
        self.fat = fat
        self.calories = calories
    }
    
    static func examples() -> [Ingredient] {
        [
            Ingredient(name: "Parboiled Rice", portionSize: 100, carbs: 75.5, protein: 8, fat: 1.5, calories: 351),
            Ingredient(name: "Basmati Rice", portionSize: 100, carbs: 75, protein: 8.8, fat: 1, calories: 351),
            Ingredient(name: "Spaghetti", portionSize: 100, carbs: 73, protein: 12, fat: 1.5, calories: 358),
            Ingredient(name: "Burger Bun", portionSize: 62.5, carbs: 31.9, protein: 5.6, fat: 4.5, calories: 195),
            Ingredient(name: "Tortilla", portionSize: 72, carbs: 37.4, protein: 6.5, fat: 5)
            
        ]
    }
    
    static func example() -> Ingredient {
        Ingredient(name: "Vegan Burger Bun", portionSize: 62.5, carbs: 33.5, protein: 5.4, fat: 3.4, calories: 192)
    }
    
}

extension Ingredient: Identifiable {}

extension Ingredient: Hashable {
    static func == (lhs: Ingredient, rhs: Ingredient) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
