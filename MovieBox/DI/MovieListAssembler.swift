//
//  MovieListAssembler.swift
//  MovieBox
//
//  Created by Bilal Akram on 7/23/25.
//

import Foundation

struct DIAssembler{
    static func makeMovieListViewModel() -> ExploreViewModel {
        let networkService = NetworkService()
        let movieService = MovieServiceImpl(networkService: networkService)
        let movieDatabase = MovieDatabase.shared
        let movieLocalDataSource = MovieLocalDataSourceImpl(movieDatabase: movieDatabase)
        let movieRepository = MovieRepositoryImpl(movieService: movieService,
                                                  movieLocalDataSource: movieLocalDataSource)
        
        return ExploreViewModel(
            getPopularMoviesUseCase: GetPopularMoviesUseCaseImpl(movieRepository: movieRepository),
            getUpcomingMoviesUseCase: GetGetUpcomingMoviesUseCaseImpl(movieRepository: movieRepository),
            getTopRatedMoviesUseCase: GetTopRatedMoviesUseCaseImpl(movieRepository: movieRepository),
        )
    }
    static func makeSearchViewModel() -> SearchViewModel {
        let networkService = NetworkService()
        let movieService = MovieServiceImpl(networkService: networkService)
        let movieDatabase = MovieDatabase.shared
        let movieLocalDataSource = MovieLocalDataSourceImpl(movieDatabase: movieDatabase)
        let movieRepository = MovieRepositoryImpl(movieService: movieService,
                                                  movieLocalDataSource: movieLocalDataSource)
        
        return SearchViewModel(
            searchMovieUseCase: SearchMoviesUseCaseImpl(movieRepository: movieRepository)
        )
    }

    static func makeWatchlistViewModel()  -> WatchlistViewModel{
        let networkService = NetworkService()
        let movieService = MovieServiceImpl(networkService: networkService)
        let movieDatabase = MovieDatabase.shared
        let movieLocalDataSource = MovieLocalDataSourceImpl(movieDatabase: movieDatabase)
        let movieRepository = MovieRepositoryImpl(movieService: movieService,
                                                  movieLocalDataSource: movieLocalDataSource)
        
        return  WatchlistViewModel(movieRepository: movieRepository)
        
    }
    
    
}
