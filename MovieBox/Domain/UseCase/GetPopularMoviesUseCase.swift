//
//  GetPopularMoviesUseCase.swift
//  MovieBox
//
//  Created by Bilal Akram on 7/22/25.
//

import Foundation
import Combine



protocol GetPopularMoviesUseCase{
    func execute() -> AnyPublisher<[Movie], Error>
}


class GetPopularMoviesUseCaseImpl : GetPopularMoviesUseCase{
    
    private let movieRepository: MovieRepository
    
    init(movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
    }
    
    func execute() -> AnyPublisher<[Movie], any Error> {
     
        return movieRepository.fetchPopularMovies()
        
    }
}
