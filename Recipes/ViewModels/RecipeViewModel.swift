//
//  RecipeViewModel.swift
//  Recipes
//
//  Created by Abdullah Hafiz on 20/09/1446 AH.
//


//
//  RecipeViewModel.swift
//  YourBurgerApp
//

import SwiftUI

class RecipeViewModel: ObservableObject {
    @Published var recipes: [RecipeData] = []

    // NEW: The text field for user-typed query
    @Published var searchText: String = ""

    // Let user pick a cuisine from a known list
    @Published var selectedCuisine: String = "American"

    @Published var errorMessage: String?

    let allCuisines: [String] = [
        "African","Asian","American","British","Cajun","Caribbean","Chinese",
        "Eastern European","European","French","German","Greek","Indian","Irish",
        "Italian","Japanese","Jewish","Korean","Latin American","Mediterranean",
        "Mexican","Middle Eastern","Nordic","Southern","Spanish","Thai","Vietnamese"
    ]

    func fetchRecipes() {
        NetworkManager.shared.fetchRecipes(
            query: searchText,       // user typed
            cuisine: selectedCuisine // user picked
        ) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let fetched):
                    self?.recipes = fetched
                case .failure(let error):
                    self?.errorMessage = "Error: \(error.localizedDescription)"
                }
            }
        }
    }

    // Example POST
    func createSamplePost() {
        NetworkManager.shared.postSampleData(
            title: "Test Title",
            body: "Test Body",
            userId: 1
        ) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    // For debugging
                    print("POST success:", String(data: data, encoding: .utf8) ?? "")
                case .failure(let error):
                    self?.errorMessage = "POST error: \(error.localizedDescription)"
                }
            }
        }
    }
}
