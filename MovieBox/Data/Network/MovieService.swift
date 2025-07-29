//
//  MovieService.swift
//  MovieBox
//
//  Created by Bilal Akram on 7/22/25.
//

import Foundation
import Combine


class MovieService {
    private let networkService : NetworkService
    private let apiKey = "efedd588c03d6b3c28c1e801ec985051"
    
    init(networkService: NetworkService){
        self.networkService = networkService
    }
    
    
    func fetchPopularMovies() -> AnyPublisher<[MovieEntity], Error> {
            var components = URLComponents(string: "https://api.themoviedb.org/3/movie/popular")!
            components.queryItems = [
                URLQueryItem(name: "api_key", value: apiKey)
            ]
            
            guard let url = components.url else {
                return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
            }
            
            print("Fetching movies from URL:", url.absoluteString)
        return networkService.request(url)
            .map { (response: MovieResponse) in
                response.movies
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
        
    }
    
    func fetchUpcomingMovies() -> AnyPublisher<[MovieEntity], Error>{
        var components = URLComponents(string: "https://api.themoviedb.org/3/movie/upcoming")!
        components.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey)
        ]
        guard let url = components.url else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        print("Fetching upcoming movies from URL:", url.absoluteString)
    return networkService.request(url)
        .map { (response: MovieResponse) in
            response.movies
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
    
    func fetchTopRatedMovies() -> AnyPublisher<[MovieEntity], Error>{
        var components = URLComponents(string: "https://api.themoviedb.org/3/movie/top_rated")!
        components.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey)
        ]
        guard let url = components.url else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        print("Fetching Top Rated Movies from URL:", url.absoluteString)
    return networkService.request(url)
        .map { (response: MovieResponse) in
            response.movies
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
    
    func searchMovies(query : String) -> AnyPublisher<[MovieEntity], Error>{
        var components = URLComponents(string: "https://api.themoviedb.org/3/search/movie")!
        components.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "query", value: query)
        ]
        guard let url = components.url else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        print("Fetching Top Rated Movies from URL:", url.absoluteString)
    return networkService.request(url)
        .map { (response: MovieResponse) in
            response.movies
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}
