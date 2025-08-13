//
//  WatchlistViewModelTests.swift
//  MovieBoxTests
//
//  Created by Bilal Akram on 8/13/25.
//

import Testing
import Combine
@testable import MovieBox


struct WatchlistViewModelTests {

    let mockRepo : MockMovieRepository
    let viewModel : WatchlistViewModel
    
    
    init(){
        mockRepo = MockMovieRepository()
        viewModel = WatchlistViewModel(movieRepository: mockRepo)
    }
    
    @Test func testToggleWatchlist() async throws {
        
        let movie = makeMovie(id: 1, title: "Movie1")
        #expect(viewModel.checkisInWatchlist(movie: movie) == false)
        
        viewModel.toggleWatchlist(for: movie)
        try await Task.sleep(for: .milliseconds(50))
        #expect(viewModel.checkisInWatchlist(movie: movie) == true)
        
        viewModel.toggleWatchlist(for: movie)
        try await Task.sleep(for: .milliseconds(50))
        #expect(viewModel.checkisInWatchlist(movie: movie) == false)
    }
    
    @Test func testFetchWatchlist() async throws {
        mockRepo.watchlist = [makeMovie(id: 1, title: "Movie1")]
        viewModel.fetchWatchlist()
        try await Task.sleep(for: .milliseconds(50))
        #expect(!viewModel.watchlist.isEmpty)
        #expect(viewModel.watchlist.count == 1)
        #expect(viewModel.watchlist.first?.title == "Movie1")
    }

    
}
