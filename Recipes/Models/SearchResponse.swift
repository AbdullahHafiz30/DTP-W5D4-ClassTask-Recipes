//
//  RecipeResponse.swift
//  Recipes
//
//  Created by Abdullah Hafiz on 20/09/1446 AH.
//

import Foundation

// Outer response from complexSearch
struct SearchResponse: Codable {
    let results: [SearchResult]
}

