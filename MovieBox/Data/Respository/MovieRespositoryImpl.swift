//
//  MovieRepository.swift
//  MovieBox
//
//  Created by Bilal Akram on 7/22/25.
//

import Foundation
import Combine

class MovieRepositoryImpl : MovieRepository {
    
    
    
    let movieService : MovieService
    init(movieService: MovieService) {
        self.movieService = movieService
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
}
