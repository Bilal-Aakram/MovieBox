//
//  MovieRepository.swift
//  MovieBox
//
//  Created by Bilal Akram on 7/22/25.
//

import Foundation
import Combine


class MovieRepositoryImpl : MovieRepository {
  
    let movieLocalDataSource : MovieLocalDataSource
    let movieService : MovieService
    private let watchlistKey = "watchlist"
    
    
    init(movieService: MovieService,
         movieLocalDataSource : MovieLocalDataSource) {
        
        self.movieService = movieService
        self.movieLocalDataSource = movieLocalDataSource
    }
    
    func fetchPopularMovies() -> AnyPublisher<[Movie], any Error> {
        return movieService.fetchPopularMovies()
            .map { movies in
                movies.prefix(5).map { movie in
                    movie.toDomain()
                }
            }.eraseToAnyPublisher()
    }
    
    func fetchUpcomingMovies() -> AnyPublisher<[Movie], any Error> {
        return movieService.fetchUpcomingMovies()
            .map { movies in
                movies.prefix(5).map { movie in
                    movie.toDomain()
                }
            }
            .eraseToAnyPublisher()
    }
    
    func fetchTopRatedMovies() -> AnyPublisher<[Movie], any Error> {
        return movieService.fetchTopRatedMovies()
            .map { movies in
                movies.prefix(5).map { movie in
                    movie.toDomain()
                }
            }
            .eraseToAnyPublisher()
    }
    
    func searchMovies(query: String) -> AnyPublisher<[Movie], any Error> {
        return movieService.searchMovies(query: query)
            .map { movies in
                movies.map { movie in
                    movie.toDomain()
                }
            }
            .eraseToAnyPublisher()
    }
    
    func addToWatchlist(movie: Movie) async {
        await self.movieLocalDataSource.insert(movie: movie)
    }
    
    func removeFromWatchlist (movie: Movie) async {
        await self.movieLocalDataSource.delete(movie: movie)
    }
    
    func fetchWatchlist() async -> [Movie]?  {
        return await self.movieLocalDataSource.fetchAll()
    }
    
        
}
