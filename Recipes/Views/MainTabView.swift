//
//  MainTabView.swift
//  Recipes
//
//  Created by Abdullah Hafiz on 20/09/1446 AH.
//


import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            APIFetchRecipesView()
                .tabItem {
                    Label("API", systemImage: "magnifyingglass")
                }

            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "heart.fill")
                }

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
