//
//  IngredientDetails.swift
//  Chop
//
//  Created by Marvin Kome on 29.02.24.
//

import SwiftUI

struct IngredientDetails: View {
    @Environment(\.editMode) private var editMode
    @Bindable var ingredient: Ingredient
    
    var body: some View {
        Form {
            Section {
                HStack {
                    Text("Name")
                        .foregroundStyle(.secondary)
                    
                    Spacer()
                    
                    if editMode?.wrappedValue.isEditing == true {
                        TextField("Parboiled Rice", text: $ingredient.name)
                            .frame(width: 200)
                            .multilineTextAlignment(.trailing)
                            
                    } else {
                        Text("\(ingredient.name)")
                    }
                }
                
                HStack(spacing: 4) {
                    Text("Portion Size")
                        .foregroundStyle(.secondary)
                    
                    Spacer()
                    
                    if editMode?.wrappedValue.isEditing == true {
                        TextField("0", value: $ingredient.portionSize, format: .number)
                            .frame(width: 100)
                            .multilineTextAlignment(.trailing)
                        
                        Text("g")
                    } else {
                        Text("\(ingredient.portionSize.formatted()) g")
                    }
                }
            }
            
            Section {
                HStack(spacing: 4) {
                    Text("Carbs")
                        .foregroundStyle(.secondary)
                    
                    Spacer()
                    
                    if editMode?.wrappedValue.isEditing == true {
                        TextField("0", value: $ingredient.carbs, format: .number)
                            .frame(width: 100)
                            .multilineTextAlignment(.trailing)
                        
                        Text("g")
                    } else {
                        Text("\(ingredient.carbs.formatted()) g")
                    }
                }
                
                HStack(spacing: 4) {
                    Text("Protein")
                        .foregroundStyle(.secondary)
                    
                    Spacer()
                    
                    if editMode?.wrappedValue.isEditing == true {
                        TextField("0", value: $ingredient.protein, format: .number)
                            .frame(width: 100)
                            .multilineTextAlignment(.trailing)
                        
                        Text("g")
                    } else {
                        Text("\(ingredient.protein.formatted()) g")
                    }
                }
                
                HStack(spacing: 4) {
                    Text("Fat")
                        .foregroundStyle(.secondary)
                    
                    Spacer()
                    
                    if editMode?.wrappedValue.isEditing == true {
                        TextField("0", value: $ingredient.fat, format: .number)
                            .frame(width: 100)
                            .multilineTextAlignment(.trailing)
                        
                        Text("g")
                    } else {
                        Text("\(ingredient.fat.formatted()) g")
                    }
                }
            }
            
            Section {
                HStack(spacing: 4) {
                    Text("Calories (optional)")
                        .foregroundStyle(.secondary)
                    
                    Spacer()
                    
                    if editMode?.wrappedValue.isEditing == true {
                        TextField("0", value: $ingredient.calories, format: .number)
                            .frame(width: 100)
                            .multilineTextAlignment(.trailing)
                        
                        Text("g")
                    } else if let calories = ingredient.calories {
                        Text("\(calories.formatted()) g")
                    }
                }
                
                HStack {
                    Text("Estimated Calories")
                        .foregroundStyle(.secondary)
                    Spacer()
                    
                    Text("\(ingredient.estimatedCalories.formatted()) kcal")
                        .multilineTextAlignment(.trailing)
                }
            }
        }
        .navigationTitle(ingredient.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                EditButton()
            }
        }
    }
}

#Preview {
    IngredientDetails(ingredient: Ingredient.example())
}
