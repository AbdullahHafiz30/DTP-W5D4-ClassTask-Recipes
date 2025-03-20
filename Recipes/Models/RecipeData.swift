//
//  RecipeData.swift
//  Recipes
//
//  Created by Abdullah Hafiz on 20/09/1446 AH.
//

import Foundation

// Each recipe in "results"
struct RecipeData: Decodable, Identifiable, Equatable {
    let id: Int
    let title: String
    let image: String
    let extendedIngredients: [ExtendedIngredient]
    let analyzedInstructions: [AnalyzedInstruction]

    // Equatable: we can compare them in favorites
    static func == (lhs: RecipeData, rhs: RecipeData) -> Bool {
        lhs.id == rhs.id
    }
}

