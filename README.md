# Spoonacular Burger Recipes

A **SwiftUI** sample app that retrieves recipes from [Spoonacular](https://spoonacular.com/food-api/docs) using two separate requests:

- **Search** for minimal recipe info (`id`, `title`, `image`) with the `complexSearch` endpoint
- **Fetch full details** (`extendedIngredients`, `instructions`) via the `/recipes/{id}/information` endpoint

It also has **Favorites** and a **Dark Mode** toggle!

---

## Features

- **Home Screen (APIFetchRecipesView)**  
  - Search by typing a query (like "burger")  
  - Filter by cuisine (e.g. "American") from a picker  
  - Show partial results (title + image) in a list

- **Recipe Detail Screen**  
  - When you tap a recipe in the list, it fetches the full detail (ingredients & instructions)  
  - Add or remove from Favorites with one tap

- **Favorites**  
  - A separate tab that lists all your favorited recipes  
  - Tapping a favorite takes you back to its detail screen

- **Settings**  
  - Simple toggle for Dark Mode on the Settings tab

---

## Setup

1. **Add Alamofire**  
   - In Xcode, go to "File → Add Packages…"  
   - Use the URL 'https://github.com/Alamofire/Alamofire.git'  
   - Choose the latest stable version

2. **Insert Spoonacular API Key**  
   - In `NetworkManager.swift`, look for `"apiKey": "<YOUR_API_KEY>"`  
   - Replace `<YOUR_API_KEY>` with your actual Spoonacular key

3. **Run on iOS 15+**  
   - The app uses SwiftUI’s `AsyncImage`, introduced in iOS 15

---

## How It Works

1. **Minimal Search**  
   - `NetworkManager.searchRecipes(query:cuisine:)` calls `GET /recipes/complexSearch`, returning only the basic info needed for the home list.

2. **Detail Fetch**  
   - Tapping a list item navigates to `RecipeDetailView`, which calls `GET /recipes/{id}/information` for the chosen recipe, returning extended ingredients & instructions.

3. **Favorites**  
   - Stored in `FavoritesManager` as an observable object.  
   - The "Add to Favorites" button toggles whether a recipe is in the user’s favorite list.

4. **Dark Mode Toggle**  
   - In the Settings tab, a toggle modifies `.preferredColorScheme` just for that view.  
   - Expand it if you want system-wide theming.

---

## File Overview

- **`NetworkManager.swift`**  
  - Contains `searchRecipes(...)` (for minimal list) and `fetchRecipeDetail(...)` (for full data).
- **`SearchResult.swift`**, **`SearchResponse.swift`**  
  - Models for the partial JSON from `complexSearch`.
- **`RecipeDetail.swift`**, **`ExtendedIngredient.swift`**, **`AnalyzedInstruction.swift`**, **`InstructionStep.swift`**  
  - Models for the detailed JSON from `/recipes/{id}/information`.
- **`RecipeViewModel.swift`**  
  - Manages state for the home screen search (like `searchText`, `selectedCuisine`).
- **`APIFetchRecipesView.swift`** (Home)  
  - UI with a `TextField` (query) + `Picker` (cuisine), triggers `viewModel.searchRecipes()`.
- **`RecipeDetailView.swift`**  
  - Fetches detailed info for a single `id`, displays ingredients & instructions, and toggles favorites.
- **`FavoritesManager.swift`**  
  - Observable class storing favorite recipes.
- **`FavoritesView.swift`**  
  - Tab for listing favorites, each linking back to its detail screen.
- **`SettingsView.swift`**  
  - Tab with a dark mode toggle.
- **`MainTabView.swift`** / **`RecipesApp.swift`**  
  - Provide the tab bar and the @main app entry.

---

## Running the App

1. **Open** the project in Xcode  
2. **Replace** the API key in `NetworkManager`  
3. **Build** & **Run** on iOS 15+ simulator or device  
4. Type a query (e.g. "burger"), select a cuisine if you like, then tap **Search**  
5. Tap a recipe to load its extended ingredients & instructions  

---

## License

This demo is for educational purposes. Spoonacular data usage is subject to their [terms & usage guidelines](https://spoonacular.com/food-api/terms). 
