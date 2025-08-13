//
//  MovieBoxTests.swift
//  MovieBoxTests
//
//  Created by Bilal Akram on 8/11/25.
//

import Foundation
import Testing
import Combine
@testable import MovieBox

var cancellables = Set<AnyCancellable>()
class MockMovieService: MovieService {

    var popularMovies: [MovieEntity] = []
    var upcomingMovies: [MovieEntity] = []
    var topRatedMovies: [MovieEntity] = []
    var searchResults: [MovieEntity] = []
    
    func fetchPopularMovies() -> AnyPublisher<[MovieEntity], any Error> {
        Just(popularMovies)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func fetchUpcomingMovies() -> AnyPublisher<[MovieEntity], any Error> {
        Just(upcomingMovies)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func fetchTopRatedMovies() -> AnyPublisher<[MovieEntity], any Error> {
        Just(topRatedMovies)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func searchMovies(query: String) -> AnyPublisher<[MovieEntity], any Error> {
        Just(searchResults)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}

final class MockMovieLocalDataSource : MovieLocalDataSource{
    var storage : [Movie] = []
    
    func insert(movie: Movie) async {
        storage.append(movie)
    }
    
    func delete(movie: Movie) async {
        storage.removeAll{ $0.id == movie.id}
    }
    
    func fetchAll() async throws -> [Movie] {
        storage
    }
}

final class MovieRepositoryImplTests {
    var repository: MovieRepositoryImpl
    var mockService : MockMovieService
    var mockLocal : MockMovieLocalDataSource
    var cancellables: Set<AnyCancellable> = []
    
    init() {
        mockService = MockMovieService()
        mockLocal = MockMovieLocalDataSource()
        repository = MovieRepositoryImpl(movieService: mockService,
                                         movieLocalDataSource: mockLocal)
    }
    
    @Test("fetchPopularMovies returns first 5 movies")
    func testFetchPopularMovies() async throws {
        mockService.popularMovies = (1...10).map { makeMovieEntity(id: $0, title: "Movie\($0)") }
        let movies = try await collect(repository.fetchPopularMovies())

        #expect(movies.count == 5)
        #expect(movies.first?.title == "Movie1")
    }

    @Test("addToWatchlist inserts movie into local storage")
    func testAddToWatchlist() async throws {
        let movie = makeMovieEntity(id: 1, title: "Test Movie").toDomain()
        await repository.addToWatchlist(movie: movie)
        let watchList = try await repository.fetchWatchlist()
        #expect(watchList.contains { $0.id == movie.id })
    }
    
    @Test("removeFromWatchlist deletes movies from Watchlist")
    func testRemoveFromWatchlist() async throws{
        let movie = makeMovieEntity(id: 1, title: "Test Movie").toDomain()
        await repository.addToWatchlist(movie: movie)
        await repository.removeFromWatchlist(movie: movie)
        
        let watchList = try await repository.fetchWatchlist()
        #expect(!watchList.contains{$0.id == movie.id})
    }
}

func collect<T>(_ publisher: AnyPublisher<[T], any Error>) async throws -> [T] {
    try await withCheckedThrowingContinuation { continuation in
        publisher
            .sink(
                receiveCompletion: { completion in
                    if case let .failure(error) = completion {
                        continuation.resume(throwing: error)
                    }
                },
                receiveValue: { value in
                    continuation.resume(returning: value)
                }
            )
            .store(in: &cancellables)
    }
}

func makeMovieEntity(id: Int, title: String) -> MovieEntity {
    return MovieEntity(
        adult: false,
        backdropPath: nil,
        genreIDS: [],
        id: id,
        originalLanguage: "en",
        originalTitle: title,
        overview: "",
        popularity: 0.0,
        posterPath: nil,
        releaseDate: nil,
        title: title,
        video: false,
        voteAverage: 0.0,
        voteCount: 0
    )
}
