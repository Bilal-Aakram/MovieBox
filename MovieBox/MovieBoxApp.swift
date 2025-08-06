//
//  MovieBoxApp.swift
//  MovieBox
//
//  Created by Bilal Akram on 7/8/25.
//

import SwiftUI
import SwiftData

@main
struct MovieBoxApp: App {

    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
        .modelContainer(for: Movie.self)
    }
}
