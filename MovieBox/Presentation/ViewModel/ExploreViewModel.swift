//
//  MovieListViewModel.swift
//  MovieBox
//
//  Created by Bilal Akram on 7/22/25.
//

import Foundation
import Combine

class ExploreViewModel: ObservableObject{
    
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
         getTopRatedMoviesUseCase : GetTopRatedMoviesUseCase,
         
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
            .receive(on: DispatchQueue.main)
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
            .receive(on: DispatchQueue.main)
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
                self.upcomingMovies = movies
            })
            .store(in: &cancellables)
    }
    
    func fetchTopRatedMovies() {
        isLoading = true
        getTopRatedMoviesUseCase.execute()
            .receive(on: DispatchQueue.main)
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
                self.topRatedMovies = movies
            })
            .store(in: &cancellables)
    }
    

    func tryAgain() {
        isError = false
        fetchPopularMovies()
        fetchUpccomingMovies()
        fetchTopRatedMovies()
    }
    
}
