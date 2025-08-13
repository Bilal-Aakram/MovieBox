//
//  ExploreViewModelTests.swift
//  MovieBoxTests
//
//  Created by Bilal Akram on 8/13/25.
//

import Testing
import Combine
@testable import MovieBox


struct ExploreViewModelTests {
    
        let mockRepo: MockMovieRepository
        let getPopularMoviesUseCase: GetPopularMoviesUseCaseImpl
        let getUpcomingMoviesUseCase: GetGetUpcomingMoviesUseCaseImpl
        let getTopRatedMoviesUseCase: GetTopRatedMoviesUseCaseImpl
        let viewModel: ExploreViewModel
        
        init() {
            mockRepo = MockMovieRepository()
            mockRepo.popularMovies = (1...3).map { makeMovie(id: $0, title: "Movie\($0)") }
            mockRepo.upcomingMovies = (1...2).map { makeMovie(id: $0, title: "Movie\($0)") }
            mockRepo.topRatedMovies = (1...4).map { makeMovie(id: $0, title: "Movie\($0)") }
            
            getPopularMoviesUseCase = GetPopularMoviesUseCaseImpl(movieRepository: mockRepo)
            getUpcomingMoviesUseCase = GetGetUpcomingMoviesUseCaseImpl(movieRepository: mockRepo)
            getTopRatedMoviesUseCase = GetTopRatedMoviesUseCaseImpl(movieRepository: mockRepo)
            
            viewModel = ExploreViewModel(
                getPopularMoviesUseCase: getPopularMoviesUseCase,
                getUpcomingMoviesUseCase: getUpcomingMoviesUseCase,
                getTopRatedMoviesUseCase: getTopRatedMoviesUseCase
            )
        }
        
        @Test("fetchPopularMovies populates popularMovies")
        func testFetchPopularMovies() async throws {
            viewModel.fetchPopularMovies()
            
            try await Task.sleep(for: .milliseconds(50))
            #expect(viewModel.popularMovies.count == 3)
            #expect(viewModel.popularMovies.first?.title == "Movie1")
        }
        
        @Test("fetchUpcomingMovies populates upcomingMovies")
        func testFetchUpcomingMovies() async throws {
            viewModel.fetchUpccomingMovies()
            
            try await Task.sleep(for: .milliseconds(50))
            #expect(viewModel.upcomingMovies.count == 2)
            #expect(viewModel.upcomingMovies.first?.title == "Movie1")
        }
        
        @Test("fetchTopRatedMovies populates topRatedMovies")
        func testFetchTopRatedMovies() async throws {
            viewModel.fetchTopRatedMovies()
            try await Task.sleep(for: .milliseconds(50))
            
            #expect(viewModel.topRatedMovies.count == 4)
            #expect(viewModel.topRatedMovies.first?.title == "Movie1")
        }
    }
    
func makeMovie(id: Int, title: String) -> Movie {
    return Movie(
        id: id,
        title: title,
        imageUrl: "",
        overview: "",
        releaseDate: nil,
        voteAverage: 0.0,
        voteCount: 0
    )
}
