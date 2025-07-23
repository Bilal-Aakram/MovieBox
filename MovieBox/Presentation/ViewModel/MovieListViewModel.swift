//
//  MovieListViewModel.swift
//  MovieBox
//
//  Created by Bilal Akram on 7/22/25.
//

import Foundation
import Combine

class MovieListViewModel: ObservableObject{
    
    @Published var isLoading: Bool = false
    @Published var popularMovies : [Movie] = []
    @Published var upcomingMovies: [Movie] = []
    @Published var topRatedMovies: [Movie] = []
    @Published var isError: Bool = false
    
    let getPopularMoviesUseCase : GetPopularMoviesUseCase
    let getUpcomingMoviesUseCase : GetUpcomingMoviesUseCase
    let getTopRatedMoviesUseCase : GetTopRatedMoviesUseCase
    
    private var cancellables = Set<AnyCancellable>()
    
    init(getPopularMoviesUseCase : GetPopularMoviesUseCase,
         getUpcomingMoviesUseCase : GetUpcomingMoviesUseCase,
         getTopRatedMoviesUseCase : GetTopRatedMoviesUseCase
    ) {
        self.getPopularMoviesUseCase = getPopularMoviesUseCase
        self.getUpcomingMoviesUseCase = getUpcomingMoviesUseCase
        self.getTopRatedMoviesUseCase = getTopRatedMoviesUseCase
        fetchPopularMovies()
        fetchUpccomingMovies()
        fetchTopRatedMovies()
    }
    
    func fetchPopularMovies() {
        isLoading = true
        getPopularMoviesUseCase.execute()
            .sink(receiveCompletion: { completion in
                self.isLoading = false
                switch completion {
                case .finished:
                    print("Finished loading movies")
                case .failure(let error):
                    self.isError = true
                    print("Error loading movies:", error.localizedDescription)
                }
            }, receiveValue: { movies in
                self.popularMovies = movies
            })
            .store(in: &cancellables)
    }
    
    func fetchUpccomingMovies() {
        isLoading = true
        getUpcomingMoviesUseCase.execute()
            .sink(receiveCompletion: { completion in
                self.isLoading = false
                switch completion {
                case .finished:
                    print("Finished loading movies")
                case .failure(let error):
                    self.isError = true
                    print("Error loading movies:", error.localizedDescription)
                }
            }, receiveValue: { movies in
                self.upcomingMovies = movies.map({ movie in
                    // Removing title for upcoming movies
                    movie.copy(id: movie.id, imageUrl: movie.imageUrl)
                })
            })
            .store(in: &cancellables)
    }
    func fetchTopRatedMovies() {
        isLoading = true
        getTopRatedMoviesUseCase.execute()
            .sink(receiveCompletion: { completion in
                self.isLoading = false
                switch completion {
                case .finished:
                    print("Finished loading movies")
                case .failure(let error):
                    self.isError = true
                    print("Error loading movies:", error.localizedDescription)
                }
            }, receiveValue: { movies in
                self.topRatedMovies = movies.map({ movie in
                    // Removing title for upcoming movies
                    movie.copy(id: movie.id, imageUrl: movie.imageUrl)
                })
            })
            .store(in: &cancellables)
    }
}
