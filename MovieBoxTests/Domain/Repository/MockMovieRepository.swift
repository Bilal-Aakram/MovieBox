//
//  MockMovieRepository.swift
//  MovieBoxTests
//
//  Created by Bilal Akram on 8/13/25.
//

import Foundation
import Combine
@testable import MovieBox


final class MockMovieRepository : MovieRepository{
    var popularMovies: [Movie] = []
    var upcomingMovies: [Movie] = []
    var topRatedMovies: [Movie] = []
    var SearchResults: [Movie] = []
    var watchlist: [Movie] = []
    
    func fetchPopularMovies() -> AnyPublisher<[Movie], Error> {
        Just(popularMovies)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func fetchUpcomingMovies() -> AnyPublisher<[Movie], Error> {
        Just(upcomingMovies)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func fetchTopRatedMovies() -> AnyPublisher<[Movie], Error> {
        Just(topRatedMovies)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func searchMovies(query: String) -> AnyPublisher<[Movie], Error> {
        let results = SearchResults.filter { $0.title?.contains(query) ?? false }
        return Just(results)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func addToWatchlist(movie: Movie) async {
        watchlist.append(movie)
    }
    
    func removeFromWatchlist(movie: Movie) async {
        watchlist.removeAll { $0.id == movie.id }
    }
    
    func fetchWatchlist() async throws -> [Movie] {
        return watchlist
    }
}
