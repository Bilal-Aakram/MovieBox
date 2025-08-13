//
//  SearchViewModelTests.swift
//  MovieBoxTests
//
//  Created by Bilal Akram on 8/13/25.
//

import Testing
import Combine
@testable import MovieBox


struct SearchViewModelTests {
    
  
    let mockRepo : MockMovieRepository
    let mockSearchUseCase : SearchMoviesUseCase
    let viewModel : SearchViewModel
    
    init() {
        mockRepo = MockMovieRepository()
        mockRepo.SearchResults = (1...3).map { makeMovie(id: $0, title: "Movie\($0)") }
        
        
        mockSearchUseCase = SearchMoviesUseCaseImpl(movieRepository: mockRepo)
               viewModel = SearchViewModel(searchMovieUseCase: mockSearchUseCase)
    }
    
    
    
    @Test func testSearchMovies() async throws {
        
        viewModel.searchMovie(query: "Movie")
        try await Task.sleep(for: .milliseconds(50))
        #expect(viewModel.searchedMovies.count == 3)
               #expect(viewModel.searchedMovies.first?.title == "Movie1")
    }

}
