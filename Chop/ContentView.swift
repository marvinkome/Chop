//
//  ContentView.swift
//  Chop
//
//  Created by Marvin Kome on 29.02.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List(0..<3) { _ in
                Section {
                    ForEach(0..<3) { _ in
                        NavigationLink {
                            MealDetails()
                        } label: {
                            HStack {
                                Text("Smunch Lunch")
                                    .font(.system(.callout))
                                    .foregroundStyle(.secondary)
                                    .lineLimit(1)
                                
                                Spacer()
                                Text("345 kcal")
                                    .font(.system(.body, weight: .medium))
                            }
                        }
                    }
                    
                    HStack {
                        Text("Total")
                        Spacer()
                        Text("1654 kcal")
                            .font(.system(.headline))
                    }
                } header: {
                    HStack {
                        Text("Friday").bold()
                        Spacer()
                        Text("29.02.2024")
                    }
                }
            }
            .navigationTitle("Meals")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button { } label: {
                        Label("Add Meal", systemImage: "plus")
                            .labelStyle(.titleAndIcon)
                    }
                }
            }
        }
    }
}

struct MealDetails: View {
    var body: some View {
        List {
            Section {
                HStack {
                    Text("Total Calories")
                        .foregroundStyle(.secondary)
                    
                    Spacer()
                    
                    Text("345 kcal")
                        .font(.system(.headline, weight: .bold))
                }
                
                HStack {
                    Text("Carbs")
                        .foregroundStyle(.secondary)
                    
                    Spacer()
                    
                    Text("265.6g")
                        .font(.system(.body, weight: .medium))
                }
                
                HStack {
                    Text("Protein")
                        .foregroundStyle(.secondary)
                    
                    Spacer()
                    
                    Text("125.6g")
                        .font(.system(.callout, weight: .medium))
                }
                
                HStack {
                    Text("Fat")
                        .foregroundStyle(.secondary)
                    
                    Spacer()
                    
                    Text("65.6g")
                        .font(.system(.callout, weight: .medium))
                }
            }
            
            Section {
                HStack {
                    Text("Burger Bun")
                    Spacer()
                    Text("Qty: 2")
                        .foregroundStyle(.secondary)
                }
                
                
                HStack {
                    Text("Eggs")
                    Spacer()
                    Text("Qty:3")
                        .foregroundStyle(.secondary)
                }
            } header: {
                Text("Ingredients")
            }
        }
        .navigationTitle("Breakfast")
    }
}

#Preview {
    MealDetails()
}

#Preview {
    ContentView()
    .environment(AppModel())
}
