//
//  MovieListViewModel.swift
//  MovieBox
//
//  Created by Bilal Akram on 7/22/25.
//

import Foundation
import Combine

class SearchViewModel: ObservableObject{
    
    @Published var isLoading: Bool = false
    @Published var searchedMovies: [Movie] = []
    @Published var isError: Bool = false
    

    let searchMovieUseCase : SearchMoviesUseCase
    
    private var cancellables = Set<AnyCancellable>()
    
    init(
         searchMovieUseCase : SearchMoviesUseCase
    ) {
        self.searchMovieUseCase = searchMovieUseCase
    }
    
    func searchMovie(query : String) {
        isLoading = true
        searchMovieUseCase.execute(query: query)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                self.isLoading = false
                switch completion {
                case .finished:
                    print("Finished loading movies")
                case .failure(let error):
                    self.isError = true
                    print("Error loading movies", error.localizedDescription)
                }
            }, receiveValue: {movies in
                self.searchedMovies = movies
            })
            .store(in: &cancellables)
    }
    

}
