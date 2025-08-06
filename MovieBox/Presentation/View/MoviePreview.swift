//
//  MoviePreview.swift
//  MovieBox
//
//  Created by Bilal Akram on 7/31/25.
//

import Foundation


extension Movie{
    
    static let preview = Movie(
            id : 0,
            title : "How to Train Your Dragon",
            imageUrl : "https://www.vintagemovieposters.co.uk/wp-content/uploads/2020/01/IMG_2891.jpeg",
            overview : "On the rugged isle of Berk, where Vikings and dragons have been bitter enemies for generations, Hiccup stands apart, defying centuries of tradition when he befriends Toothless, a feared Night Fury dragon. Their unlikely bond reveals the true nature of dragons, challenging the very foundations of Viking society.",
            releaseDate : "2025-06-06",
            voteAverage : 8.138,
            voteCount : 1069,
            )
    
    private static func preview(withId : Int = 0) -> Movie{
        return Movie(
            id : withId,
            title : "How to Train Your Dragon",
            imageUrl : "https://www.vintagemovieposters.co.uk/wp-content/uploads/2020/01/IMG_2891.jpeg",
            overview : "On the rugged isle of Berk, where Vikings and dragons have been bitter enemies for generations, Hiccup stands apart, defying centuries of tradition when he befriends Toothless, a feared Night Fury dragon. Their unlikely bond reveals the true nature of dragons, challenging the very foundations of Viking society.",
            releaseDate : "2025-06-06",
            voteAverage : 8.138,
            voteCount : 1069,
            )
    }
    
    static let previewList = (1...4).map { Movie.preview(withId: $0) }
}
