//
//  MovieService.swift
//  MovieBox
//
//  Created by Bilal Akram on 8/11/25.
//

import Foundation
import Combine

protocol MovieService{
    func fetchPopularMovies() -> AnyPublisher<[MovieEntity], Error>
    func fetchUpcomingMovies() -> AnyPublisher<[MovieEntity], Error>
    func fetchTopRatedMovies() -> AnyPublisher<[MovieEntity], Error>
    func searchMovies(query : String) -> AnyPublisher<[MovieEntity], Error>
}
