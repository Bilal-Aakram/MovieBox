//
//  MovieRespository.swift
//  MovieBox
//
//  Created by Bilal Akram on 7/22/25.
//

import Foundation
import Combine

protocol MovieRepository {
    func fetchPopularMovies() -> AnyPublisher<[Movie], Error>
    func fetchUpcomingMovies () -> AnyPublisher<[Movie], Error>
    func fetchTopRatedMovies () -> AnyPublisher<[Movie], Error>
}
