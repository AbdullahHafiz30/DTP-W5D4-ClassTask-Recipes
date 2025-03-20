//
//  FavoritesManager.swift
//  Recipes
//
//  Created by Abdullah Hafiz on 20/09/1446 AH.
//


//
//  FavoritesManager.swift
//  YourBurgerApp
//

import SwiftUI

class FavoritesManager: ObservableObject {
    @Published var favoriteRecipes: [RecipeData] = []

    func toggleFavorite(_ recipe: RecipeData) {
        if favoriteRecipes.contains(recipe) {
            // remove if it exists
            favoriteRecipes.removeAll { $0.id == recipe.id }
        } else {
            // add if it doesn’t
            favoriteRecipes.append(recipe)
        }
    }

    func isFavorite(_ recipe: RecipeData) -> Bool {
        favoriteRecipes.contains(recipe)
    }
}
