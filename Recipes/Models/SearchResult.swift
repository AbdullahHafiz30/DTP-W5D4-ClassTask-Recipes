//
//  SearchResult.swift
//  Recipes
//
//  Created by Abdullah Hafiz on 20/09/1446 AH.
//

import Foundation

// Minimal fields from complexSearch
// for the Home list screen
struct SearchResult: Codable, Identifiable, Equatable {
    let id: Int
    let title: String
    let image: String

    // Equatable for favorites if you like:
    static func == (lhs: SearchResult, rhs: SearchResult) -> Bool {
        lhs.id == rhs.id
    }
}
