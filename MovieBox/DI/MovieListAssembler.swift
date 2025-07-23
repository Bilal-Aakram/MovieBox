//
//  MovieListAssembler.swift
//  MovieBox
//
//  Created by Bilal Akram on 7/23/25.
//

import Foundation

struct MovieListAssembler{
   static func makeMovieListViewModel() -> MovieListViewModel {
        let networkService = NetworkService()
        let movieService = MovieService(networkService: networkService)
        let movieRepository = MovieRepositoryImpl(movieService: movieService)
        
        return MovieListViewModel(
            getPopularMoviesUseCase: GetPopularMoviesUseCaseImpl(movieRepository: movieRepository),
            getUpcomingMoviesUseCase: GetGetUpcomingMoviesUseCaseImpl(movieRepository: movieRepository),
            getTopRatedMoviesUseCase: GetTopRatedMoviesUseCaseImpl(movieRepository: movieRepository)
        )
    }
}
