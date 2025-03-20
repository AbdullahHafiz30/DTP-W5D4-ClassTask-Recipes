//
//  RecipeResponse.swift
//  Recipes
//
//  Created by Abdullah Hafiz on 20/09/1446 AH.
//


//
//  APIDecodableModels.swift
//  YourBurgerApp
//

import Foundation

// Outer response from Spoonacular
struct RecipeResponse: Decodable {
    let results: [RecipeData]
}
