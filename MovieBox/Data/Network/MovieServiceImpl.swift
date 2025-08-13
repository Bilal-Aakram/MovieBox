//
//  MovieService.swift
//  MovieBox
//
//  Created by Bilal Akram on 7/22/25.
//

import Foundation
import Combine

class MovieServiceImpl: MovieService {
    private let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func fetchPopularMovies() -> AnyPublisher<[MovieEntity], Error> {
        requestMovies(endpoint: "/movie/popular")
    }
    
    func fetchUpcomingMovies() -> AnyPublisher<[MovieEntity], Error> {
        requestMovies(endpoint: "/movie/upcoming")
    }
    
    func fetchTopRatedMovies() -> AnyPublisher<[MovieEntity], Error> {
        requestMovies(endpoint: "/movie/top_rated")
    }
    
    func searchMovies(query: String) -> AnyPublisher<[MovieEntity], Error> {
        requestMovies(endpoint: "/search/movie", extraQueryItems: [
            URLQueryItem(name: "query", value: query)
        ])
    }
    
    private func requestMovies(endpoint: String, extraQueryItems: [URLQueryItem] = []) -> AnyPublisher<[MovieEntity], Error> {
        var components = URLComponents(string: "\(Configuration.baseURL)\(endpoint)")!
        components.queryItems = [
            URLQueryItem(name: "api_key", value: Configuration.apiKey)
        ] + extraQueryItems
        
        guard let url = components.url else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
                
        return networkService.request(url)
            .map { (response: MovieResponse) in
                response.movies
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
