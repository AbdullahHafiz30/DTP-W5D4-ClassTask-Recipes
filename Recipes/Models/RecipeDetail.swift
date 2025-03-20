//
//  RecipeDetail.swift
//  Recipes
//
//  Created by Abdullah Hafiz on 20/09/1446 AH.
//

import Foundation

struct RecipeDetail: Codable, Identifiable, Equatable {
    let id: Int
    let title: String
    let image: String

    // The detailed fields:
    let extendedIngredients: [ExtendedIngredient]?
    let analyzedInstructions: [AnalyzedInstruction]?

    // Optional arrays, because sometimes data might be missing
    // You can unify them if you want

    // For favorites
    static func == (lhs: RecipeDetail, rhs: RecipeDetail) -> Bool {
        lhs.id == rhs.id
    }
}
