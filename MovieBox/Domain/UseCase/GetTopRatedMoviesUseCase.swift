//
//  GetTopRatedMoviesUseCase.swift
//  MovieBox
//
//  Created by Bilal Akram on 7/23/25.
//

import Foundation
import Combine

protocol GetTopRatedMoviesUseCase{
    func execute () -> AnyPublisher<[Movie], Error>
}


class GetTopRatedMoviesUseCaseImpl: GetTopRatedMoviesUseCase{

    private let movieRepository : MovieRepository
    
    init(movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
    }
    func execute() -> AnyPublisher<[Movie], any Error> {
     
        return movieRepository.fetchTopRatedMovies()
        
    }
}
