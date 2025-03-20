//
//  FavoritesManager.swift
//  Recipes
//
//  Created by Abdullah Hafiz on 20/09/1446 AH.
//

import SwiftUI

class FavoritesManager: ObservableObject {
    @Published var favoriteRecipes: [RecipeDetail] = []

    func toggleFavorite(_ recipeDetail: RecipeDetail) {
        if favoriteRecipes.contains(recipeDetail) {
            // remove if it exists
            favoriteRecipes.removeAll(where: { $0.id == recipeDetail.id })
        } else {
            // add if it doesn’t
            favoriteRecipes.append(recipeDetail)
        }
    }

    func isFavorite(_ recipeDetail: RecipeDetail) -> Bool {
        favoriteRecipes.contains(recipeDetail)
    }
}
