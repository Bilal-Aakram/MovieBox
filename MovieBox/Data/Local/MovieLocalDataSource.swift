//
//  MovieLocalDataSource.swift
//  MovieBox
//
//  Created by Bilal Akram on 8/11/25.
//

import Foundation

protocol MovieLocalDataSource{
    
    func insert(movie : Movie) async
    func delete (movie : Movie) async
    func fetchAll() async throws -> [Movie]
}
