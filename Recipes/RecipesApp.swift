//
//  RecipesApp.swift
//  Recipes
//
//  Created by Abdullah Hafiz on 20/09/1446 AH.
//

import SwiftUI

@main
struct RecipesApp: App {
    @StateObject var favoritesManager = FavoritesManager()

    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(favoritesManager)
        }
    }
}
