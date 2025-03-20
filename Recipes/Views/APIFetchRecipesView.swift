//
//  APIFetchRecipesView.swift
//  Recipes
//
//  Created by Abdullah Hafiz on 20/09/1446 AH.
//


import SwiftUI

struct APIFetchRecipesView: View {
    @StateObject private var viewModel = RecipeViewModel()

    var body: some View {
        NavigationView {
            VStack {
                // A text field for user’s search
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
                    viewModel.searchRecipes()
                }
                .padding()

                // Show any error
                if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .padding(.horizontal)
                }

                // List of minimal search results
                List(viewModel.results) { item in
                    // item is a `SearchResult`
                    // Tapping goes to a detail screen for that ID
                    NavigationLink(destination: RecipeDetailView(recipeID: item.id)) {
                        HStack {
                            AsyncImage(url: URL(string: item.image)) { phase in
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

                            Text(item.title)
                                .font(.headline)
                        }
                    }
                }
            }
            .navigationTitle("Recipes")
        }
        .onAppear {
            // initial search if you like
            viewModel.searchRecipes()
        }
    }
}
