//
//  GetPopularMoviesUseCase.swift
//  MovieBox
//
//  Created by Bilal Akram on 7/22/25.
//

import Foundation
import Combine

protocol SearchMoviesUseCase{
    func execute(query : String) -> AnyPublisher<[Movie], Error>
}

class SearchMoviesUseCaseImpl : SearchMoviesUseCase{
   
    
    private let movieRepository: MovieRepository
    
    init(movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
    }

    func execute(query : String) -> AnyPublisher<[Movie], any Error> {
        return movieRepository.searchMovies(query : query)
    }
}
