//
//  NewIngredient.swift
//  Chop
//
//  Created by Marvin Kome on 29.02.24.
//

import SwiftUI

struct NewIngredient: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(AppModel.self) private var model
    
    @State private var name = ""
    @State private var portionSize: Double?
    @State private var carbs: Double?
    @State private var protein: Double?
    @State private var fat: Double?
    @State private var calories: Double?
    
    func saveIngredient() {
        guard !name.isEmpty else { return dismiss() }
        
        let ingredient = Ingredient(
            name: name,
            portionSize: portionSize ?? 0,
            carbs: carbs ?? 0,
            protein: protein ?? 0,
            fat: fat ?? 0,
            calories: calories
        )
        model.ingredients.append(ingredient)
        dismiss()
    }
    
    var body: some View {
        Form {
            Section {
                HStack {
                    Text("Name")
                        .foregroundStyle(.secondary)
                    
                    Spacer()
                    
                    TextField("Parboiled Rice", text: $name)
                        .frame(width: 200)
                        .multilineTextAlignment(.trailing)
                }
                
                HStack(spacing: 4) {
                    Text("Portion Size")
                        .foregroundStyle(.secondary)
                    
                    Spacer()
                    
                    TextField("0", value: $portionSize, format: .number)
                        .frame(width: 100)
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.trailing)
                    
                    Text("g")
                }
            }
            
            Section {
                HStack(spacing: 4) {
                    Text("Carbs")
                        .foregroundStyle(.secondary)
                    
                    Spacer()
                    
                    TextField("0", value: $carbs, format: .number)
                        .frame(width: 100)
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.trailing)
                    
                    Text("g")
                }
                
                HStack(spacing: 4) {
                    Text("Protein")
                        .foregroundStyle(.secondary)
                    
                    Spacer()
                    
                    TextField("0", value: $protein, format: .number)
                        .frame(width: 100)
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.trailing)
                    
                    Text("g")
                }
                
                HStack(spacing: 4) {
                    Text("Fat")
                        .foregroundStyle(.secondary)
                    Spacer()
                    
                    TextField("0", value: $fat, format: .number)
                        .frame(width: 100)
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.trailing)
                    
                    Text("g")
                }
            }
            
            Section {
                HStack(spacing: 4) {
                    Text("Calories (optional)")
                        .foregroundStyle(.secondary)
                    Spacer()
                    
                    TextField("0", value: $calories, format: .number)
                        .frame(width: 100)
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.trailing)
                    
                    Text("kcal")
                }
            }
        }
        .navigationTitle("New Ingredient")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save", action: saveIngredient)
            }
        }
    }
}

#Preview {
    NewIngredient()
        .environment(AppModel())
}
