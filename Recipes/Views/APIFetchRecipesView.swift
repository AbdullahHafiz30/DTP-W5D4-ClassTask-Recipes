//
//  APIFetchRecipesView.swift
//  Recipes
//
//  Created by Abdullah Hafiz on 20/09/1446 AH.
//


//
//  APIFetchRecipesView.swift
//  YourBurgerApp
//

import SwiftUI

struct APIFetchRecipesView: View {
    @StateObject private var viewModel = RecipeViewModel()

    var body: some View {
        NavigationView {
            VStack {
                // A text field for the user’s search
                TextField("Type a dish (e.g. 'burger')", text: $viewModel.searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .padding(.top)

                // Cuisine Picker
                Picker("Cuisine", selection: $viewModel.selectedCuisine) {
                    ForEach(viewModel.allCuisines, id: \.self) { cuisine in
                        Text(cuisine).tag(cuisine)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .padding()

                // "Search" button
                Button("Search") {
                    viewModel.fetchRecipes()
                }
                .padding()

                // Show any error
                if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .padding(.horizontal)
                }

                // List of results
                List(viewModel.recipes) { recipe in
                    NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                        HStack {
                            // load the image
                            AsyncImage(url: URL(string: recipe.image)) { phase in
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

                            // show the title
                            Text(recipe.title)
                                .font(.headline)
                        }
                    }
                }
            }
            .navigationTitle("Recipes")
        }
        .onAppear {
            // If you want an initial fetch:
            viewModel.fetchRecipes()
        }
    }
}
