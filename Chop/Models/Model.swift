//
//  Model.swift
//  Chop
//
//  Created by Marvin Kome on 29.02.24.
//

import Foundation
import SwiftUI

@Observable 
final class AppModel {
    public var ingredients: [Ingredient] = []
    
    init() {
        ingredients = Ingredient.examples()
    }
}
