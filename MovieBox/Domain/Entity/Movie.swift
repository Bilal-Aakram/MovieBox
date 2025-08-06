//
//  Movie.swift
//  MovieBox
//
//  Created by Bilal Akram on 7/8/25.
//

import Foundation
import SwiftData

@Model
final class Movie: Sendable {
    var id: Int
    var title: String?
    var imageUrl: String
    var overview : String
    var releaseDate : String?
    var voteAverage: Double
    var voteCount: Int
   
    
    
    
    init(id: Int, title: String?, imageUrl: String, overview: String,
         releaseDate: String?, voteAverage: Double, voteCount: Int) {
        self.id = id
        self.title = title
        self.imageUrl = imageUrl
        self.overview = overview
        self.releaseDate = releaseDate
        self.voteAverage = voteAverage
        self.voteCount = voteCount
    
    }
}

