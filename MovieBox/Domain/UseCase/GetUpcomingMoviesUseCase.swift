//
//  GetUpcomingMoviesUseCase.swift
//  MovieBox
//
//  Created by Bilal Akram on 7/23/25.
//

import Foundation
import Combine

protocol GetUpcomingMoviesUseCase{
    func execute () -> AnyPublisher<[Movie], Error>
}

class GetGetUpcomingMoviesUseCaseImpl: GetUpcomingMoviesUseCase{
    
    private let movieRepository : MovieRepository
    
    init(movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
    }
    
    func execute() -> AnyPublisher<[Movie], any Error> {
        return movieRepository.fetchUpcomingMovies()
    }
}
