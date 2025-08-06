//
//  MovieResponse.swift
//  MovieBox
//
//  Created by Bilal Akram on 7/22/25.
//


import Foundation


struct MovieResponse: Codable {
    let page: Int
    let movies: [MovieEntity]
    
    enum CodingKeys: String, CodingKey {
        case  page
        case movies = "results"
    }
    
}

struct MovieEntity: Codable {
    let adult: Bool
    let backdropPath: String?
    let genreIDS: [Int]
    let id: Int
    let originalLanguage: String
    let originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String?
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    func toDomain() -> Movie{
        return Movie(
            id: id,
            title:originalTitle,
            imageUrl: "https://image.tmdb.org/t/p/w500\(posterPath ?? "")",
            overview: overview,
            releaseDate: releaseDate,
            voteAverage: voteAverage,
            voteCount: voteCount
           
        )
    }
}

/*enum OriginalLanguage: String, Codable {
    case en = "en"
    case ja = "ja"
    case zh = "zh"
}*/
