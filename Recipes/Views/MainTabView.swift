//
//  MainTabView.swift
//  Recipes
//
//  Created by Abdullah Hafiz on 20/09/1446 AH.
//


//
//  MainTabView.swift
//  YourBurgerApp
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            // 1st tab: API-based recipes search
            APIFetchRecipesView()
                .tabItem {
                    Label("API", systemImage: "magnifyingglass")
                }

            // 2nd tab: Favorites
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "heart.fill")
                }

            // 3rd tab: Settings
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}



#Preview {
    MainTabView()
}
