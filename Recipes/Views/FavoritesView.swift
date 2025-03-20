//
//  FavoritesView.swift
//  Recipes
//
//  Created by Abdullah Hafiz on 20/09/1446 AH.
//


import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favoritesManager: FavoritesManager

    var body: some View {
        NavigationView {
            if favoritesManager.favoriteRecipes.isEmpty {
                VStack(spacing: 10) {
                    Image(systemName: "heart.slash")
                        .font(.system(size: 50))
                        .foregroundColor(.gray)
                    Text("No Favorites")
                        .font(.headline)
                        .foregroundColor(.gray)
                }
                .padding()
                .navigationTitle("Favorites")
            } else {
                List(favoritesManager.favoriteRecipes) { detail in
                    NavigationLink(destination: RecipeDetailView(recipeID: detail.id)) {
                        HStack {
                            AsyncImage(url: URL(string: detail.image)) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                case .success(let image):
                                    image.resizable()
                                         .scaledToFill()
                                         .frame(width: 60, height: 60)
                                         .clipShape(RoundedRectangle(cornerRadius: 5))
                                case .failure:
                                    Image(systemName: "photo")
                                @unknown default:
                                    EmptyView()
                                }
                            }
                            .frame(width: 60, height: 60)
                            Text(detail.title)
                                .font(.headline)
                        }
                    }
                }
                .navigationTitle("Favorites")
            }
        }
    }
}
