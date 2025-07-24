//
//  MainTabView.swift
//  MovieBox
//
//  Created by Bilal Akram on 7/24/25.
//

import SwiftUI

struct MainTabView: View {
    @State private var selection = 0
    var body: some View {
        TabView(selection: $selection) {
            Tab("Explore", systemImage: "house", value: 0) {
                MovieExploreView()
            }
            Tab("Search", systemImage: "magnifyingglass", value: 1) {
                MovieExploreView()
            }
            Tab("Watchlist", systemImage: "list.bullet.below.rectangle", value: 2) {
                MovieExploreView()
            }
        }
    }
}

#Preview {
    MainTabView()
}
