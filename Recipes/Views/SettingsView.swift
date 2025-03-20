//
//  SettingsView.swift
//  Recipes
//
//  Created by Abdullah Hafiz on 20/09/1446 AH.
//


import SwiftUI

struct SettingsView: View {
    @State private var isDarkMode = false

    var body: some View {
        NavigationView {
            VStack {
                Toggle("Enable Dark Mode", isOn: $isDarkMode)
                    .padding()
            }
            .preferredColorScheme(isDarkMode ? .dark : .light)
            .navigationTitle("Settings")
        }
    }
}
