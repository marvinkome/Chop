//
//  Ingredients.swift
//  Chop
//
//  Created by Marvin Kome on 29.02.24.
//

import SwiftUI

struct Ingredients: View {
    @Environment(AppModel.self) private var model
    @State private var showNewIngredient = false
    
    var body: some View {
        NavigationStack {
            List(model.ingredients) { ingredient in
                NavigationLink {
                    IngredientDetails(ingredient: ingredient)
                } label: {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(ingredient.name)
                            
                            Text("Per \(ingredient.portionSize.formatted())g")
                                .font(.footnote)
                                .foregroundStyle(.secondary)
                        }
                        
                        Spacer()
                        
                        let calories = ingredient.calories ?? ingredient.estimatedCalories
                        Text("\(calories.formatted()) Kcal")
                            .font(.system(.body, weight: .semibold))
                    }
                }
            }
            .navigationTitle("Ingredients")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button { showNewIngredient = true } label: {
                        Label("New Ingredient", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showNewIngredient) {
                NavigationStack {
                    NewIngredient()
                }
                .presentationDetents([.large])
            }
        }
    }
}

#Preview {
    Ingredients()
    .environment(AppModel())
}
