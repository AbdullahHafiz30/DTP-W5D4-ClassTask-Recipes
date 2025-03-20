//
//  RecipeDetailView.swift
//  Recipes
//
//  Created by Abdullah Hafiz on 20/09/1446 AH.
//


import SwiftUI

struct RecipeDetailView: View {
    let recipeID: Int

    @State private var detail: RecipeDetail?
    @State private var errorMessage: String?

    @EnvironmentObject var favoritesManager: FavoritesManager

    var body: some View {
        ScrollView {
            if let detail = detail {
                VStack(alignment: .leading, spacing: 16) {
                    // image
                    AsyncImage(url: URL(string: detail.image)) { phase in
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

                    // title
                    Text(detail.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top, 8)

                    // ingredients
                    if let ingredients = detail.extendedIngredients, !ingredients.isEmpty {
                        Text("Ingredients:")
                            .font(.headline)
                        ForEach(ingredients) { ing in
                            Text("• \(ing.original)")
                        }
                    }

                    // instructions
                    if let instructions = detail.analyzedInstructions,
                       !instructions.isEmpty {
                        Text("Instructions:")
                            .font(.headline)
                            .padding(.top, 8)
                        ForEach(instructions, id: \.steps) { instr in
                            ForEach(instr.steps) { step in
                                Text("\(step.number). \(step.step)")
                                    .padding(.bottom, 2)
                            }
                        }
                    } else {
                        Text("No instructions provided.")
                            .foregroundColor(.gray)
                    }

                    // Favorites button
                    Button(action: {
                        favoritesManager.toggleFavorite(detail)
                    }) {
                        Text(
                            favoritesManager.isFavorite(detail)
                            ? "Remove from Favorites"
                            : "Add to Favorites"
                        )
                        .bold()
                        .padding()
                        .foregroundColor(.white)
                        .background(
                            favoritesManager.isFavorite(detail) ? Color.red : Color.blue
                        )
                        .cornerRadius(8)
                    }
                    .padding(.top, 8)
                }
                .padding()
            } else if let err = errorMessage {
                Text("Error: \(err)")
                    .foregroundColor(.red)
            } else {
                Text("Loading...")
            }
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            fetchDetail()
        }
    }

    func fetchDetail() {
        NetworkManager.shared.fetchRecipeDetail(id: recipeID) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let detailData):
                    self.detail = detailData
                case .failure(let error):
                    self.errorMessage = "Error: \(error.localizedDescription)"
                }
            }
        }
    }
}
