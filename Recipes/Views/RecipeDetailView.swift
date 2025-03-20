//
//  RecipeDetailView.swift
//  Recipes
//
//  Created by Abdullah Hafiz on 20/09/1446 AH.
//


//
//  RecipeDetailView.swift
//  YourBurgerApp
//

import SwiftUI

struct RecipeDetailView: View {
    let recipe: RecipeData
    @EnvironmentObject var favoritesManager: FavoritesManager

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Image
                AsyncImage(url: URL(string: recipe.image)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image.resizable().scaledToFit()
                    case .failure:
                        Image(systemName: "photo")
                    @unknown default:
                        EmptyView()
                    }
                }

                // Title
                Text(recipe.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 8)

                // Ingredients
                if !recipe.extendedIngredients.isEmpty {
                    Text("Ingredients:")
                        .font(.headline)
                    ForEach(recipe.extendedIngredients) { ing in
                        Text("• \(ing.original)")
                    }
                }

                // Steps
                if let first = recipe.analyzedInstructions.first {
                    Text("Instructions:")
                        .font(.headline)
                        .padding(.top, 8)
                    ForEach(first.steps) { step in
                        Text("\(step.number). \(step.step)")
                            .padding(.bottom, 2)
                    }
                }

                // Favorite button
                Button(action: {
                    favoritesManager.toggleFavorite(recipe)
                }) {
                    Text(
                        favoritesManager.isFavorite(recipe)
                        ? "Remove from Favorites"
                        : "Add to Favorites"
                    )
                    .bold()
                    .padding()
                    .foregroundColor(.white)
                    .background(favoritesManager.isFavorite(recipe) ? Color.red : Color.blue)
                    .cornerRadius(8)
                }
                .padding(.top, 8)
            }
            .padding()
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
